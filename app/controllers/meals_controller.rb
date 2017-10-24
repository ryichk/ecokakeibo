class MealsController < ApplicationController
  def index
    @meal = Meal.where(user_id: current_user.id).order('created_at').select('cuisine_id')
    @calorie = Cuisine.where(id: @meal)
    @meal_date = Meal.where(user_id: current_user.id)
  end

  def new
    @meal = Meal.new
    @cuisines = Cuisine.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
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
