Rails.application.routes.draw do
  get 'catalogs/index'

  root 'catalogs#index'

  resources :authors
end
