Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  resources :posts
  resources :comments, only: [:new, :create, :destroy]
  resources :likes, only: [:new, :create]
  # Defines the root path route ("/")

  resources :users do
    member do
      get 'api_token'
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments
      end
    end
  end
end
