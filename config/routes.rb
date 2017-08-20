Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    sessions: 'users/sessions'
  }

  resources :users, only: [:show]
  resources :campgrounds, only: [:show]

  root 'campgrounds#index'
end
