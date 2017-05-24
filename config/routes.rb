Rails.application.routes.draw do
  get 'pages/home'

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # localhost:3000/welcome/index is the URI pattern
  get 'welcome/index'

  # this is saying that: pages is controller and #home is the action
  get 'pages/home', to: 'pages#home'

  get 'pages/about', to: 'pages#about'
  # root sets the it as the homepage
  # this is saying that: welcome is controller and #index is the action
  root 'welcome#index'
end
