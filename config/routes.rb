Snatchit::Application.routes.draw do
  get "sales/index"
  get "sales/show"
  devise_for :users
  root to: 'sales#index'

  resources :sales, only: [:index, :show]
end
