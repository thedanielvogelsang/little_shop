Rails.application.routes.draw do
  root to: 'courses#index'
  resources :categories, only: [:index, :show] do
    resources :courses, only: [:index]
  end

  post '/carts', to: "carts#create"
  get '/cart', to: "carts#show"
end
