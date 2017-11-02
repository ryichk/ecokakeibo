class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy


  def index
    @user = User.where(setai: current_user.setai).select('id')
    co2_ids = Kakeibo.includes(:user).where(user_id: @user).group(:user_id).order('sum_env_load ASC').sum(:env_load).keys
    @ranking1 = co2_ids.map { |id| User.find(id) }
    vw_ids = Meal.includes(:user).where(user_id: @user).group(:user_id).order('sum_virtualwater ASC').sum(:virtualwater).keys
    @ranking2 = vw_ids.map { |id| User.find(id) }
    fm_ids = Meal.includes(:user).where(user_id: @user).group(:user_id).order('sum_foodmileage ASC').sum(:foodmileage).keys
    @ranking3 = fm_ids.map { |id| User.find(id) }
    @setai = User.find(current_user.id)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
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
    redirect_to(root_url) unless current_user.admin?
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :setai, :avatar)
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
      redirect_to(root_url) unless current_user?(@user)
    end
end
