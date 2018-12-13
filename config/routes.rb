Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'profile', to: "users#profile"

  resources :users do
  	resources :pets
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
