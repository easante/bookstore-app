Rails.application.routes.draw do
  root 'catalogs#index'

  get '/add_publisher', to: 'publishers#new', as: 'add_publisher'
  get '/add_book', to: 'books#new', as: 'add_book'

  resources :authors
  resources :publishers, except: [:new]
  resources :books, except: [:new]
end
