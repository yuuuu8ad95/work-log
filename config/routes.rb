Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  get 'documents/index'
  root to: "documents#index"
  resources :users, only: [:edit, :update]
  resources :documents do
    resources :comment, only: [:create] 
  end
end
