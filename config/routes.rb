Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/usuario/:id', to: 'users#show', as: 'usuario'

<<<<<<< HEAD
  get "/usuario/:id/search", to: "users#search"
=======
  get '/usuario/:id/admin', to: 'users#admin', as: 'admin'
  get '/usuario/:id/owner', to: 'users#owner', as: 'owner'
  get '/usuario/:id/buyer', to: 'users#buyer', as: 'buyer'
>>>>>>> master

  get '/booking/:booking_id/completed', to: 'bookings#completed', as: 'completed'

  get "/nosotros", to: "pages#nosotros"
  get "/covid", to: "pages#covid"
  resources :services do
    resources :bookings, only: [:new, :create]
  end

  get "/mapa", to: "pages#mapa"
  resources :services do
    resources :bookings, only: [:show]
  end

  resources :bookings, only: [:show, :destroy] do
    resources :reviews, only: [:create]
 
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
