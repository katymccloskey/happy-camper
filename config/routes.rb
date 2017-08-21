Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    sessions: 'users/sessions'
  }

  resources :users, only: [:show]
  resources :campgrounds, only: [:show]
  match 'campgrounds/:id/no-detail': "campgrounds#no_detail"
  root 'campgrounds#index'
end
