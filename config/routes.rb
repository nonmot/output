Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  
  get 'groups' => "groups#index"
  get 'groups/new' => "groups#new"
  get "groups/:id" => "groups#show"
  post "groups/create" => "groups#create"
  post "groups/:id/join" => "groups#join"
  delete "groups/:id/destroy" => "groups#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
