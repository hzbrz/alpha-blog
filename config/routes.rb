Rails.application.routes.draw do
  # The priority is based on the order of creation: first created -> highest priority

  # this is saying that: pages is controller and #home is the action
  get 'pages/home', to: 'pages#home'
  # root sets the it as the homepage
  # this is saying that: welcome is controller and #index is the action
  root 'pages#home'

  get 'pages/about', to: 'pages#about'


  # Gave us all the RESTful actions for articles.
  # rails routes in cmd to see the newly added routes for articles
  resources :articles

  # We could not do resources :users because we want customized routes, for example we want signup to go to users#new
  get 'signup', to: 'users#new'
  # The signup form in the new view needs a post action otherwise it throws an error
  # post 'users', to: 'users#create' works...but the efficient way is:
  resources :users, except: [:new] # This creates all the RESTful routes for the User object except for the custom route

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
