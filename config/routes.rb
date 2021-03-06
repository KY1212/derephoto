Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'images#index'
  resources :images, only: [:new, :create, :destroy] do
    resources :comments, only: [:create]
  end
  resources :users, only: [:destroy]

  resources :images do
    collection do
      get "auto_complete"
    end
  end
  resources :images do
    member do
      get :edit
    end
  end

post "/" => "images#index"
get "/images" => "images#index"
get "/users" => "users#index"
get "/sorts" => "sorts#index"


post   '/like/:image_id' => 'likes#like',   as: 'like'
delete '/like/:image_id' => 'likes#unlike', as: 'unlike'

get "/images" => "images#test"
get "/users/:id" => "users#show"
get "/images/:id/edit" => "images#edit"
post "/images/:id/update" => "images#update"
#indexページから削除
delete "/images/:id" => "images#destroy"
#マイページから削除
delete "/users/:id" => "images#destroy"


end
