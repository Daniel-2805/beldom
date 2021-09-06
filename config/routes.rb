Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/usuario/:id', to: 'users#show', as: 'usuario'

  get '/usuario/:id/admin', to: 'users#admin', as: 'admin'
  get '/usuario/:id/owner', to: 'users#owner', as: 'owner'
  get '/usuario/:id/buyer', to: 'users#buyer', as: 'buyer'

  get '/booking/:booking_id/completed', to: 'bookings#completed', as: 'completed'

  get "/nosotros", to: "pages#nosotros"
  resources :services do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :destroy] do
    resources :reviews, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
