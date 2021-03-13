Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  get "user/:id" => "pages#user"

  resources :groups
  post "groups/:id/join" => "groups#join"

  resources :messages, only: [:create, :destroy]

  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
