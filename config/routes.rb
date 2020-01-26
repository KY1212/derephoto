Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'images#index'
  resources :images, only: [:new, :create, :destroy]
  resources :users, only: [:destroy]

  resources :images do
    collection do
      get "auto_complete"
    end
  end

post "/" => "images#index"
get "/images" => "images#index"
get "/users" => "users#index"

get "/images" => "images#test"
get "/users/:id" => "users#show"
#indexページから削除
delete "/images/:id" => "images#destroy"
#マイページから削除
delete "/users/:id" => "images#destroy"


end
