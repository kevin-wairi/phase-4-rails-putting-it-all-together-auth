Rails.application.routes.draw do
  resources :recipes
  resources :users
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  post '/signup', to: 'users#create'
  delete "/logout", to: "sessions#destroy"

  # post '/login',to: 'users#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
