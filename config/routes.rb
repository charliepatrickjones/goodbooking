Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get '/users/:id/dashboard', to: 'users#dashboard'
  root to: 'pages#home'
  resources :restaurants do
    resources :reviews, only: [:show, :edit, :update, :new, :create]
    resources :bookings, only: [:show, :edit, :update, :new, :create]
  end
  resources :reviews, only: [:index,:destroy]
  resources :bookings, only: [:index, :destroy]
end
