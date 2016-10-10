Rails.application.routes.draw do
  root to: "users#new"

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :goals
  resources :comments, only: [:create, :destroy]
end
