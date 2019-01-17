Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "user_registrations" }

  resources :users
  # products
  resources :products
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'simple_pages/landing_page'

  post 'simple_pages/thank_you', to: 'simple_page#thank_you'

  post 'payments/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # landing page - featured product
  root 'simple_pages#landing_page'

  # orders
  resources :orders, only: [:index, :show, :create, :destroy]

  resources :products do
    resources :comments
  end
end
