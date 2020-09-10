Rails.application.routes.draw do

  devise_for :users
   devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :goods, only: :index
    resources :wents, only: :index
  end
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
