Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "documents#index"
  resources :users, only: [:show, :edit, :update]
  resources :documents do
    resources :comments, only: [:create] 
  end
end
