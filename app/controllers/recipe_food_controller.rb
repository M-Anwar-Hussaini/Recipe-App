class RecipeFoodController < ApplicationController
  def index
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id])
  end
end
