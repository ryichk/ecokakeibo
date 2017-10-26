class KakeibosController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :destroy]
  before_action :kakeibo_in, only: :env

  def index

    @kakeibos = Kakeibo.includes(:user).page(params[:page]).order("month ASC")
    @denki_data = Kakeibo.where(user_id: current_user.id).group(:month).order("month ASC").sum(:denki_cost)
    @gas_data = Kakeibo.where(user_id: current_user.id).group(:month).order("month ASC").sum(:gas_cost)
    @suidou_data = Kakeibo.where(user_id: current_user.id).group(:month).sum(:suidou_cost)
    @denki = Kakeibo.where(user_id: current_user.id).group(:month).order("month ASC").sum(:denki)
    @gas = Kakeibo.where(user_id: current_user.id).group(:month).order("month ASC").sum(:gas)
    @suidou = Kakeibo.where(user_id: current_user.id).group(:month).order("month ASC").sum(:suidou)
  end


  def new
    @kakeibo = Kakeibo.new
  end

  def show
    @user = User.find(params[:id])
    @denki = Kakeibo.includes(:user).where(user_id: current_user.id).group(:month).order("month ASC").sum(:denki_env)
    @gas = Kakeibo.includes(:user).where(user_id: current_user.id).group(:month).order("month ASC").sum(:denki_env)
    @suidou = Kakeibo.includes(:user).where(user_id: current_user.id).group(:month).order("month ASC").sum(:denki_env)
    @month = Kakeibo.includes(:user).where(user_id: current_user.id).group(:month).order('month ASC').last
    @env = Kakeibo.includes(:user).where(user_id: current_user.id).group(:month).sum(:env_load)
    @meal_vw = Meal.includes(:user).where(user_id: current_user.id).sum(:virtualwater)
    @meal_fm = Meal.includes(:user).where(user_id: current_user.id).sum(:foodmileage)
    @vw = Meal.where(user_id: current_user.id).group(:created_at).sum(:virtualwater)
    @fm = Meal.where(user_id: current_user.id).group(:created_at).order('created_at ASC').sum(:foodmileage)
  end

  def create
    Kakeibo.create(create_params)
    @kakeibo = Kakeibo.new(create_params)
    if @kakeibo.save
      redirect_to "/kakeibos/#{current_user.id}/"
    else
      render 'new'
    end
  end

  def destroy
    kakeibo = Kakeibo.find(params[:id])
    kakeibo.destroy if kakeibo.user_id == current_user.id
  end


    private
      def create_params
        params.require(:kakeibo).permit(:denki, :denki_cost, :gas, :gas_cost, :suidou, :suidou_cost, :month, :user_id)
      end


      def kakeibo_in
        unless env.present?
          redirect_to root_url, alert: "家計簿を入力してください。"
        end
      end


end
