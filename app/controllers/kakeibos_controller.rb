class KakeibosController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :destroy]

  def index
    @kakeibos = Kakeibo.page(params[:page]).order("month ASC")
    @kakeibo = Kakeibo.where(user_id: current_user.id).group(:month).order("month ASC")
    @denki_data = @kakeibo.sum(:denki_cost)
    @gas_data = @kakeibo.sum(:gas_cost)
    @suidou_data = @kakeibo.sum(:suidou_cost)
    @denki = @kakeibo.sum(:denki)
    @gas = @kakeibo.sum(:gas)
    @suidou = @kakeibo.sum(:suidou)
  end


  def new
    @kakeibo = Kakeibo.new
  end


  def create
    @kakeibo = Kakeibo.new(create_params)
    if @kakeibo.save
      redirect_to "/kakeibos/#{current_user.id}/"
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
    @meal_vw = @meal.sum(:virtualwater)
    @meal_fm = @meal.sum(:foodmileage)
    @vw = @meal.group(:created_at).sum(:virtualwater)
    @fm = @meal.group(:created_at).order('created_at ASC').sum(:foodmileage)
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
