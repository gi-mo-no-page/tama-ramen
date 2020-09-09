Rails.application.routes.draw do

  devise_for :users
   devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :edit, :update]
  resources :shops, shallow: true do
    resources :reviews
    resources :maps, only: :index
    resources :menus, only: :index
    collection do
      get 'search'
    end
  end
  root to: "shops#index"
end
