Rails.application.routes.draw do
  devise_for :users
  resources :shops
  resources :users, only: [:show, :edit, :update]
  root to: "shops#index"
end
