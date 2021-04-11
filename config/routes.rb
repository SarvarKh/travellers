Rails.application.routes.draw do
  root "opinions#index"
  resources :users, only: [:show, :new, :create]
  resources :opinions, only: [:index, :new, :create, :destroy]
  resources :followings, only: [:create, :destroy]
  resources :votes, only: [:create, :destroy]
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
