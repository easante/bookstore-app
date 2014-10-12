Rails.application.routes.draw do
  root 'catalogs#index'

  get '/add_publisher', to: 'publishers#new', as: 'add_publisher'

  resources :authors
  resources :publishers, except: [:new]
end
