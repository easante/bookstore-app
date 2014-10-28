Rails.application.routes.draw do
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  root 'catalogs#index'

  get '/add_publisher', to: 'publishers#new', as: 'add_publisher'
  get '/add_book', to: 'books#new', as: 'add_book'
  get '/signup', to: 'users#new', as: 'signup'

  resources :authors
  resources :publishers, except: [:new]
  resources :books, except: [:new]
  resources :users, only: [:create, :show]
  resource :session, only: [:destroy]
end
