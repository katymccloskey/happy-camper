Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    sessions: 'users/sessions'
  }

  resources :users, only: [:show]
  resources :campgrounds, only: [:show]

  post 'campgrounds/:id/favorite', to: 'campgrounds#toggle_favorite', as: 'favorite_campground'

  get 'campgrounds/:id/no-detail', to: "campgrounds#no_detail", as: 'no_detail'

  root 'campgrounds#index'
end
