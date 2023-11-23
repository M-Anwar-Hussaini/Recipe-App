class Food < ApplicationRecord
  # validates :price, numericality: { only_integer: true }
  has_many :recipe_foods, dependent: :destroy
  belongs_to :user
end
