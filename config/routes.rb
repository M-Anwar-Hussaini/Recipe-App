Rails.application.routes.draw do
  root 'recipes#index'
  resources :recipes, only: [:index, :new, :create, :destroy, :show]
  resources :food, only: [:index, :new, :create, :destroy, :show]
end
