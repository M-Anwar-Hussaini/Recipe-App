Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :recipes, only: [:index, :new, :create, :destroy, :show]
  get 'recipe-food/index'
  get 'food/index'
end
