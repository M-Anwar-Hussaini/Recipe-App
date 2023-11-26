# spec/views/recipes/index.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password123') }

  before do
    assign(:recipes, [])
    allow(view).to receive(:current_user).and_return(user)
  end

  context 'when there are no recipes' do
    it 'displays a message about no recipes' do
      render

      expect(rendered).to have_content('List of All recipes')
      expect(rendered).to have_link('Add a new recipe', href: new_recipe_path)
      expect(rendered).to have_content('There is not any recipe yet')
      expect(rendered).not_to have_selector('ul.list-group li')
    end
  end

  context 'when there are recipes' do
    let(:recipe1) { Recipe.create(name: 'Pasta', description: 'Delicious pasta', public: true, user:) }
    let(:recipe2) { Recipe.create(name: 'Salad', description: 'Healthy salad', public: false, user:) }

    before do
      assign(:recipes, [recipe1, recipe2])
    end
  end
end
