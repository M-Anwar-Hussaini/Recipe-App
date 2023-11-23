class FoodController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to food_index_path
    else
      render :new, notice: 'Please try again'
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price, :other_attributes)
  end
end
