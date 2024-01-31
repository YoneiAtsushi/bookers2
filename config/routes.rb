Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:edit, :show, :index, :update] do
  resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorite, only: [:create, :destroy]
  end
  get "search" => "searches#search"
  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
