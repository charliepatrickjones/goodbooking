Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get '/users/:id/dashboard', to: 'users#dashboard', as: 'dashboard'
  get '/restaurants/:restaurant_id/bookings/:id', to: 'bookings#accept', as: 'accept'
  root to: 'pages#home'
  resources :restaurants do
    resources :bookings, only: [:show, :edit, :update, :new, :create, :index ]
  end
  resources :reviews, only: [:index,:destroy]
  resources :bookings, only: [:index, :destroy] do 
    resources :reviews, only: [:show, :edit, :update, :new, :create]
  end
  
end
