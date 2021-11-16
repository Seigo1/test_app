Rails.application.routes.draw do
  get 'users/show'
    root to: 'homes#top'
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :shops, only: [:new, :create, :index, :show, :destroy] do
        resources :favorites, only: [:create, :destroy]
        resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
end
