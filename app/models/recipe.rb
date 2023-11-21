class Recipe < ApplicationRecord
  validates :name, :preparation_time, :cooking_time, :description, presence: true
end
