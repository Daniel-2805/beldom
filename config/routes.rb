Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :services do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
