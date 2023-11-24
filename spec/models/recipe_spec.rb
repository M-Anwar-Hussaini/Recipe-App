require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: "Anwar Hussaini", email: "anwar@gmail.com", password: "123456") }

  it "is valid with valid attributes" do
    recipe = Recipe.new(
      name: "Spaghetti Bolognese",
      preparation_time: 20,
      cooking_time: 30,
      description: "A classic pasta dish.",
      public: true,
      user: user
    )
    expect(recipe).to be_valid
  end

  it "is not valid without required attributes" do
    recipe = Recipe.new
    expect(recipe).to_not be_valid
    expect(recipe.errors[:name]).to include("can't be blank")
    expect(recipe.errors[:preparation_time]).to include("can't be blank")
    expect(recipe.errors[:cooking_time]).to include("can't be blank")
    expect(recipe.errors[:description]).to include("can't be blank")
  end

  it "is  valid with a false 'public' value" do
    recipe = Recipe.new(name: "Test Recipe", preparation_time: 10, cooking_time: 20, description: "Test", public: false, user: user)
    expect(recipe).to be_valid
  end

  it "has many recipe_foods and destroys them when deleted" do
    recipe = Recipe.create(name: "Pizza", preparation_time: 15, cooking_time: 25, description: "Homemade pizza", public: true, user: user)
    food1 = Food.create(name: "Tomato", price: 1.5)
    food2 = Food.create(name: "Cheese", price: 2.0)

    recipe_food1 = RecipeFood.create(recipe: recipe, food: food1)
    recipe_food2 = RecipeFood.create(recipe: recipe, food: food2)

    expect { recipe.destroy }.to change { RecipeFood.count }.by(0)
  end

  it "belongs to a user" do
    recipe = Recipe.new(name: "Salad", preparation_time: 10, cooking_time: 15, description: "Healthy salad", public: false, user: user)
    expect(recipe.user).to eq(user)
  end

  it "toggles the 'public' attribute" do
    recipe = Recipe.create(name: "Bread", preparation_time: 5, cooking_time: 20, description: "Freshly baked bread", public: false, user: user)
    initial_public_value = recipe.public

    recipe.toggle_public
    expect(recipe.public).to_not eq(initial_public_value)
  end

  it "calculates the total price of associated foods" do
    recipe = Recipe.create(name: "Smoothie", preparation_time: 10, cooking_time: 5, description: "Fruit smoothie", public: true, user: user)
    food1 = Food.create(name: "Banana", price: 0)
    food2 = Food.create(name: "Strawberry", price: 0, user: user)

    RecipeFood.create(recipe: recipe, food: food1)
    RecipeFood.create(recipe: recipe, food: food2)

    expect(recipe.total_price).to eq(0)
  end
end
