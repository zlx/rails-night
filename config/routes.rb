RailsNight::Application.routes.draw do
  get 'users/edit'
  resources :users, only: [:show, :update]
  get "home/index"
  get "sessions/new", as: :login_in
  delete "sessions/destroy", as: :sign_out
  post "sessions", to: "sessions#create"
  root to: 'home#index'
end
