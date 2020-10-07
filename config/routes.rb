Rails.application.routes.draw do
  devise_for :users
  root to: "documents#index"
  resources :users, only: [:edit, :update]
  resources :documents do
    resources :comments, only: [:create] 
  end
end
