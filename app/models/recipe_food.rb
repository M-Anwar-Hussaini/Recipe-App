class RecipeFood < ApplicationRecord
  validates :quantity, numericality: { only_integer: true }
  belongs_to :recipe_id
  belongs_to :food_id
end
