Rails.application.routes.draw do

  root 'courses#index'
  get "/courses", to: "courses#index"

  resources :users, only: [:new, :create]

  resources :categories, only: [:index] do
    resources :courses, only: [:index, :show]
  end

  resources :sessions, only: [:create]

  post '/carts', to: "carts#create"
  get '/cart', to: "carts#show"
  delete '/cart', to: "carts#destroy"
  post '/cart', to: 'carts#update'
  get '/dashboard', to: 'users#show'
  get '/login', to: 'sessions#new'
  get ':category_id', to: 'categories#show'
end
