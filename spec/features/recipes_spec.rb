# spec/features/recipes_spec.rb
require 'rails_helper'

RSpec.feature "Recipes", type: :feature do
  let(:user) { User.create(name: "John Doe", email: "john@example.com", password: "password123") }

  before do
    sign_in user
  end

  scenario "User views the list of all recipes" do
    # Create some recipes for testing
    recipe1 = Recipe.create(name: "Pasta", preparation_time: 15.5, cooking_time: 20.5, description: "Delicious pasta", public: true, user: user)
    recipe2 = Recipe.create(name: "Salad", preparation_time: 10.5, cooking_time: 15.5, description: "Healthy salad", public: false, user: user)

    visit recipes_path

    expect(page).to have_content("List of All recipes")
    expect(page).to have_link("Add a new recipe", href: new_recipe_path)

    expect(page).to have_selector("ul.list-group li", count: 2)

    within("ul.list-group") do
      expect(page).to have_content("Pasta")
      expect(page).to have_content("Salad")
    end
  end

  scenario "User adds a new recipe" do
    visit recipes_path

    click_link "Add a new recipe"

    fill_in "Name", with: "Soup"
    fill_in "Preparation time", with: 10.5
    fill_in "Cooking time", with: 15.5
    fill_in "Description", with: "Delicious soup"
    check "Public"

    click_button "Create Recipe"

    expect(page).to have_content("The recipe successfully created.")
    expect(page).to have_content("Soup")
  end

  scenario "User removes a recipe" do
    recipe = Recipe.create(name: "Cake", preparation_time: 20.5, cooking_time: 30.5, description: "Delicious cake", public: false, user: user)

    visit recipes_path

    expect(page).to have_content("Cake")

    click_button "Remove"

    expect(page).to have_content("The recipe was successfully deleted.")
    expect(page).not_to have_content("Cake")
  end

  scenario "User shows details of a recipe" do
    recipe = Recipe.create(name: "Pizza", preparation_time: 15.5, cooking_time: 25.5, description: "Homemade pizza", public: true, user: user)

    visit recipes_path

    expect(page).to have_content("Pizza")

    click_link "Show details"

    expect(page).to have_content("Pizza")
    expect(page).to have_content("Homemade pizza")
  end
end
