Rails.application.routes.draw do
  root to: 'courses#index'
  resources :categories, only: [:index, :show]
  resources :courses, only: [:index, :show]


  post '/carts', to: "carts#create"
  get '/cart', to: "carts#show"
  delete '/cart', to: "carts#destroy"
  post '/add', to: 'carts#add'
end
