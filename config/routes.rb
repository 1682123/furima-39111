Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :buyer_records, only: [:index, :create]
  end
end
