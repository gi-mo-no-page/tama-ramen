Rails.application.routes.draw do
  resources :shops
  root to: "shops#index"
end
