Rails.application.routes.draw do
  root to: 'courses#index'
  resources :categories, only: [:show]
  resources :courses, only: [:index, :show]
  
  resources :users, only: [:new, :create, :edit, :update]
  
  resources :orders, only: [:index, :new, :create, :update, :show]
  resources :sessions, only: [:new, :create]

  post '/carts', to: 'carts#create'
  get '/cart', to: 'carts#show'
  delete '/cart', to: 'carts#destroy'
  post '/cart', to: 'carts#update'
  get '/dashboard', to: 'users#show'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get ':category_id', to: 'categories#show'

  namespace :admin do
    get '/dashboard', to: 'orders#index'
    resources :courses, only: [:new, :create, :show, :index, :edit]
    resources :orders, only: [:update, :show]
  end
end
