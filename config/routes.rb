Rails.application.routes.draw do
devise_for :users, :controllers => { :registrations => "users/registrations" }

  root 'pages#index'
  get '/about', to: 'pages#about'
  resources :items
  get :mon_panier, to: "carts#index", as: :mon_panier
  get "thumbnail/:id", to: "carts#show", as: :thumbnail
  post '/panier/:id', to: "carts#add_to_cart", as: :adding
  delete '/suppr', to: "carts#delete_to_cart", as: :suppr
  post "/create_order", to: "orders#create", as: :create_order
  get "/new_order", to: "orders#new", as: :new_order
  get '/admin', to: "pages#admin"
  get '/orders', to: "pages#orders"
  get '/mon_profil', to: 'pages#profile', as: :mon_profil
  post "/payment/stripe", to: "carts#payment", as: :payment
  patch :mon_panier, to: "carts#update"
  delete '/del', to: "carts#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
