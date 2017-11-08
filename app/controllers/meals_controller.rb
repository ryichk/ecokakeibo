class MealsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :destroy]
  def index
    @meals = Meal.where(user_id: current_user.id).order('created_at')
  end

  def new
    @meal = Meal.new
    @yasai = Cuisine.where("genre = '野菜'").select("id,name").map{|f| [f.name, f.id]}
    @niku = Cuisine.where("genre = '肉のおかず'").select("id,name").map{|f| [f.name, f.id]}
    @sakana = Cuisine.where("genre = '魚介のおかず'").select("id,name").map{|f| [f.name, f.id]}
    @tamago = Cuisine.where("genre = '卵・大豆製品'").select("id,name").map{|f| [f.name, f.id]}
    @soup = Cuisine.where("genre = 'シチュー・スープ・汁物'").select("id,name").map{|f| [f.name, f.id]}
    @gohan = Cuisine.where("genre = 'ごはんもの'").select("id,name").map{|f| [f.name, f.id]}
    @pasta = Cuisine.where("genre = 'パスタ・グラタン'").select("id,name").map{|f| [f.name, f.id]}
    @men = Cuisine.where("genre = '麺'").select("id,name").map{|f| [f.name, f.id]}
    @pan = Cuisine.where("genre = 'パン・ピザ'").select("id,name").map{|f| [f.name, f.id]}
    @kona = Cuisine.where("genre = '粉もの'").select("id,name").map{|f| [f.name, f.id]}
    @agemono = Cuisine.where("genre = '揚げ物'").select("id,name").map{|f| [f.name, f.id]}
    @nabe = Cuisine.where("genre = '鍋もの'").select("id,name").map{|f| [f.name, f.id]}
    @kobachi = Cuisine.where("genre = '小鉢'").select("id,name").map{|f| [f.name, f.id]}
  end

  def create
    Meal.create(create_params)
    redirect_to "/meals"
  end

  def destroy
    meal = Meal.find(params[:id])
    meal.destroy if meal.user_id == current_user.id
  end


  private
    def create_params
      params.require(:meal).permit(:cuisine_id, :user_id)
    end

end
