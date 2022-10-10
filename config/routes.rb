Rails.application.routes.draw do
  resources :hesis
  devise_for :users
  resources :students
  resources :advisors
  resources :programs

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root :to => "hesis#index"
end
