class Recipe < ApplicationRecord
  belongs_to :user
  validates :name, :preparation_time, :cooking_time, :description, presence: true
  validates :public, inclusion: { in: [true, false] }

  def toggle_public
    self.public = !public
    save
  end
end
