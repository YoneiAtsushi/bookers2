Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :index, :show, :edit]
  resources :users, only: [:edit, :show, :index]
 
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
end
