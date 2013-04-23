Snatchit::Application.routes.draw do
  resources :products

  devise_for :users
  root to: 'products#index'

  resources :products, only: [:index]

  resources :sales do
    resources :products
  end
end
