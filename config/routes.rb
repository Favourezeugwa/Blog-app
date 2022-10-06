Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  resources :posts
  resources :comments, only: [:new, :create, :destroy]
  resources :likes, only: [:new, :create]
  # Defines the root path route ("/")
end
