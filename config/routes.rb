Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  get "user/:id" => "pages#user"

  resources :groups
  post "groups/:id/join" => "groups#join"

  resources :messages, only: [:create, :destroy]

  get "books/search" => "books#search"
  get "books/result" => "books#result"
  post "books/subscribe" => "books#subscribe"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
