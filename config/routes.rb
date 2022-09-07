Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'events#index'
  resources :events
  resources :attendances
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
