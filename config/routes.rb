Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books
  resources :authors
  root 'pages#index'
end
