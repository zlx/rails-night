RailsNight::Application.routes.draw do
  resources :activities do
    collection do
      get :past
    end
    member do
      post :join
    end
  end

  get 'users/edit'
  resources :users, only: [:show, :update]
  get "home/index"
  get "sessions/new", as: :login_in
  delete "sessions/destroy", as: :sign_out
  post "sessions", to: "sessions#create"
  root to: 'home#index'
end
