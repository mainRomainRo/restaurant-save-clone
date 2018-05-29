Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :items
  get :mon_panier, to: "carts#index", as: :mon_panier
  get "thumbnail/:id", to: "carts#show", as: :thumbnail
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
