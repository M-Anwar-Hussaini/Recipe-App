class AddUserIdToRecipe < ActiveRecord::Migration[7.1]
  def change
    add_reference :recipes, :users, foreign_key: true
  end
end
