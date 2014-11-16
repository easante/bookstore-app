Rails.application.routes.draw do

  namespace :admin do
    get 'base/index'
    resources :authors
    resources :users
    resources :publishers, except: [:new]
    resources :books, except: [:new]
  end

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  root 'catalogs#index'

  get '/add_publisher', to: 'admin/publishers#new', as: 'add_publisher'
  get '/add_book', to: 'admin/books#new', as: 'add_book'
  get '/signup', to: 'users#new', as: 'signup'
  get '/reset_password', to: 'password_resets#new'
  get '/expired_token', to: 'password_resets#expired_token'

  resources :books, only: [:show]
  resources :users, only: [:create, :show]
  resource :session, only: [:destroy]
  resources :carts, only: [:show, :destroy]
  resources :cart_items, only: [:create]
  resources :orders, only: [:new, :create]
  resources :password_resets, only: [:create, :edit, :update]

  resources :catalogs, only: [:index, :show] do
    collection do
      post :search, to: 'catalogs#search'
    end
  end
end
