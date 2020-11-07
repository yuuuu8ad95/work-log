Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "documents#index"
  resources :users, only: [:index, :show, :edit, :update] do
    resources :memos, only: [:index, :new]
  end

  resources :documents do
    collection do
      get 'search'
    end
    resources :comments, only: [:create] 
    resources :marks, only: [:create, :destroy]
  end

end
