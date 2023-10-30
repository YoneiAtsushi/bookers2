Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users, only: [:edit, :show, :index, :update]
  resource :favorite, only: [:create, :destroy]

  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
end
