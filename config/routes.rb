Rails.application.routes.draw do
  get 'users/new'

  devise_for :users
  resources :blogs
  resources :users
  root 'blogs#index'
end
