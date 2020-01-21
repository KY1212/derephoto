Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'images#index'
  resources :images, only: [:new, :create]
  resources :users

post "/" => "images#index"
get "/images" => "images#index"

get "/images" => "images#test"
get "/users/:id" => "users#show"
end
