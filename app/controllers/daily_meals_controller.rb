class DailyMealsController < ApplicationController
  before_action :authenticate_catering!

  def index
    @daily_meals = DailyMeal.where(catering: current_catering, serving_day: Date.today)
    @catering = current_catering
  end

  def new
    @daily_meal = DailyMeal.new
    @meals = Meal.where(catering: current_catering)
  end

  def create
    @selected_meals = params.require(:daily_meal).permit(meal: [])[:meal].reject { |e| e.empty? }

    @selected_meals.each do |sm|
      @new_daily_meal = current_catering.daily_meals.build(
        serving_day: Date.today,
        meal_id: sm
      )
      @new_daily_meal.save
    end
  end
end
