Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :public_recipes, only: [:index]
  resources :recipes, only: [:index, :new, :create, :destroy, :show]
  resources :food, only: [:index, :new, :create, :destroy, :show]
end
