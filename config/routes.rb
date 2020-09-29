Rails.application.routes.draw do
  get 'documents/index'
  root to: "documents#index"
end
