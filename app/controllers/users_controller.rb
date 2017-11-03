class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :show]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy


  def index
    @id = Kakeibo.group(:user_id).sum(:env_load).keys
    @setai = User.where(id: @id).select(:setai)
    co2_ids = Kakeibo.group(:user_id).order('sum_env_load ASC').sum(:env_load).keys
    @ranking1 = co2_ids.map { |id| User.find(id) }
    vw_ids = Meal.includes(:user).group(:user_id).order('sum_virtualwater ASC').sum(:virtualwater).keys
    @ranking2 = vw_ids.map { |id| User.find(id) }
    fm_ids = Meal.includes(:user).group(:user_id).order('sum_foodmileage ASC').sum(:foodmileage).keys
    @ranking3 = fm_ids.map { |id| User.find(id) }
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to '/kakeibos/new'
    else
      render 'new'
    end
  end


  def show
    @user = User.find(params[:id])
    @kakeibo = Kakeibo.where(user_id: current_user.id).group(:month).order("month ASC")
    @meal = Meal.where(user_id: current_user.id)
    @denki = @kakeibo.sum(:denki_env)
    @gas = @kakeibo.sum(:gas_env)
    @suidou = @kakeibo.sum(:suidou_env)
    @month = @kakeibo.last
    @env = @kakeibo.sum(:env_load)
    @meal_vw = @meal.select("month(created_at) as ordered_month, sum(virtualwater) as total_virtualwater").group("month(created_at)").sum(:virtualwater).values[0]
    @meal_fm = @meal.select("month(created_at) as ordered_month, sum(foodmileage) as total_foodmileage").group("month(created_at)").sum(:foodmileage).values[0]
    @vw = @meal.select("date(created_at) as ordered_date, sum(virtualwater) as total_virtualwater").group("date(created_at)").sum(:virtualwater)
    @fm = @meal.select("date(created_at) as ordered_date, sum(foodmileage) as total_foodmileage").group("date(created_at)").sum(:foodmileage)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id])
    flash[:success] = "アカウントは削除されました。"
    redirect_to users_url
  end

  def admin_user
    redirect_to '/kakeibos/new' unless current_user.admin?
  end


  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :setai, :avatar)
    end

    # beforeフィルター

    #ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to signup_url
      end
    end


    #正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to 'kakeibos#new' unless current_user?(@user)
    end
end
