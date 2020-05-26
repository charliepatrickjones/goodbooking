Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurants do
    resources :reviews, only: [:show, :edit, :update, :new, :create, :index]
    resources :bookings, only: [:show, :edit, :update, :new, :create, :index]
  end
  resources :reviews, only: [:destroy]
  resources :bookings, only: [:destroy]
end
