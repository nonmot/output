Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root 'pages#index'

  get "user/:id" => "pages#user"

  resources :groups
  post "groups/:id/join" => "groups#join"

  
  resources :messages, only: [:create, :destroy]

  resources :books, only: [:create, :destroy]
  get "books/search" => "books#search"
  get "books/result" => "books#result"

  namespace :api, format: 'json' do
    resources :groups, only: [:index, :show, :create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
