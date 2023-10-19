Rails.application.routes.draw do
  resources :books, only: [:new, :index, :show, :edit]
  resources :users, only: [:edit, :show, :index]
  devise_for :users
  root to: 'homes#top'
end
