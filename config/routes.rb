Rails.application.routes.draw do
  namespace :admin do
    get 'base/index'
    resources :authors
    resources :publishers, except: [:new]
    resources :books, except: [:new]
  end

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  root 'catalogs#index'

  get '/add_publisher', to: 'admin/publishers#new', as: 'add_publisher'
  get '/add_book', to: 'admin/books#new', as: 'add_book'
  get '/signup', to: 'users#new', as: 'signup'

  resources :users, only: [:create, :show]
  resource :session, only: [:destroy]
end
