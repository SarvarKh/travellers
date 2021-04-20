Rails.application.routes.draw do
  root 'opinions#index'
  resources :users, only: %i[edit update show new create]
  resources :opinions, only: %i[index new create destroy]
  resources :followings, only: %i[create destroy]
  resources :votes, only: %i[create destroy]
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
