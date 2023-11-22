class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
end
