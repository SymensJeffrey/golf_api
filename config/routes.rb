Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"

  post "/sessions" => "sessions#create"

  get "/scores" => "scores#index"
  post "/scores" => "scores#create"
  get "/scores/:id" => "scores#show"
  patch "/scores/:id" => "scores#update"
  delete "/scores/:id" => "scores#destroy"

  get "/tournaments" => "tournaments#index"
  get "/tournaments/:id" => "tournaments#show"
  post "/tournaments" => "tournaments#create"
  patch "/tournaments/:id" => "tournaments#update"
  delete "/tournaments/:id" => "tournaments#destroy"

  get "/courses" => "courses#index"
  post "/courses" => "courses#create"
  get "/courses/:id" => "courses#show"
  delete "courses/:id" => "courses#destroy"

  post "/passwords/reset" => "passwords#create"
  patch "passwords/update" => "passwords#update"
end
