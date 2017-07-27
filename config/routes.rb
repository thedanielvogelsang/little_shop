Rails.application.routes.draw do

  root 'courses#index'
  get "/courses", to: "courses#index"

  resources :categories, only: [:index] do
    resources :courses, only: [:index, :show]
  end

  post '/carts', to: "carts#create"
  get '/cart', to: "carts#show"
  delete '/cart', to: "carts#destroy"
  post '/cart', to: 'carts#update'

  get ':category_id', to: 'categories#show'
end
