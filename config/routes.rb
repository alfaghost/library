Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books
  resources :authors
  resources :categories
  root 'pages#index'
end
