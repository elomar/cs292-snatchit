Snatchit::Application.routes.draw do
  resources :products

  devise_for :users
  root to: 'products#index'

  resources :products, only: [:index] do
    resources :bids, only: [:new, :create]
  end

  resources :sales do
    resources :products
  end
end
