Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:edit, :show, :index, :update]
  
  resources :books do
  resources :book_comments, only: [:create]
  resource :favorite, only: [:create, :destroy]
  end

  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
end
