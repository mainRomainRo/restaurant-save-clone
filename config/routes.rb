Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :items
  get '/signup', to: 'users#new', as: 'signup'
  get    '/login',   to: 'sessions#new', as: 'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as:'logout'
  get '/item/:id', to: "items#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
