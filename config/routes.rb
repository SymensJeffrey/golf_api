Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  get "/users" => "users#index"
  get "/users/:id" => "users#show"

  post "/sessions" => "sessions#create"

  
end