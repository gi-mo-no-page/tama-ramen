Rails.application.routes.draw do
  devise_for :users
  resources :shops
  root to: "shops#index"
end
