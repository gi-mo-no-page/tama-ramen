Rails.application.routes.draw do

  devise_for :users
   devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :edit, :update]
  resources :shops, shallow: true do
    resources :menus, only: :index
    resources :reviews, only: :index
    collection do
      get 'search'
    end
  end
  root to: "shops#index"
end
