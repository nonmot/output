Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  
  get 'groups' => "groups#index"
  get 'groups/new' => "groups#new"
  post "groups/create" => "groups#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
