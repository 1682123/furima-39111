Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :buyer_records, only: [:index, :new, :create]
end
