Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:index, :new, :create, :show]
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
