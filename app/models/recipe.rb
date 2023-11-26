class Recipe < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  belongs_to :user
  validates :name, :preparation_time, :cooking_time, :description, presence: true
  validates :public, inclusion: { in: [true, false] }

  def toggle_public
    self.public = !public
    save
  end

  def total_price
    total = 0
    recipe_foods.each do |rf|
      total += rf.food.price
    end
    total
  end
end
