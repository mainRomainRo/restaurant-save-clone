Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :items
  get :mon_panier, to: "carts#show", as: :mon_panier
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
