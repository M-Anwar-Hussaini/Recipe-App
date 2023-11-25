class ShoppingListController < ApplicationController
  def index
    @foods = Food.all
    @counter = 0
    @total = 0

    @foods.each do |food|
      food[:price] = Food.find(food[:id]).price
      food[:measurement_unit] = Food.find(food[:id]).measurement_unit
      @total += (food[:quantity] * food[:price])
      @counter += 1
    end
  end
end
