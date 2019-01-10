Rails.application.routes.draw do
  # products
  resources :products
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'simple_pages/landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # landing page - featured product
  # root 'simple_pages#landing_page'

  ### TASK 5.1
  root 'products#index'

  # orders
  resources :orders, only: [:index, :show, :create, :destroy]
end
