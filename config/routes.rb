Rails.application.routes.draw do
  devise_for :users
  get 'documents/index'
  root to: "documents#index"
  resources :users, only: [:edit, :update]
end
