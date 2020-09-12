Rails.application.routes.draw do

  devise_for :users
   devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :edit, :update]
  resources :shops, shallow: true do
    resources :goods, only: [:index, :create, :destroy]
    resources :wents, only: [:index, :create, :destroy]
    resources :maps, only: :index
    resources :reviews
    resources :menus
    collection do
      get 'search'
    end
  end
  root to: "shops#index"
end
