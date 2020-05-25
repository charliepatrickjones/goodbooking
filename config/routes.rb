Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurants do
    resources :reviews, only: [:edit, :update, :new, :create]
    resources :bookings, only: [:edit, :update, :new, :create]
  end
  resources :reviews, except: [:edit, :update, :new, :create]
  resources :bookings, except: [:edit, :update, :new, :create]
end
