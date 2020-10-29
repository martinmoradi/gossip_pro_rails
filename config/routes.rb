Rails.application.routes.draw do
  
  root to:'static_pages#home', as: 'home'

  get 'static_pages/team', to: 'static_pages#team'
  get 'static_pages/contact', to: 'static_pages#contact'
  get 'welcome/:name', to: 'static_pages#welcome'
  get 'signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  

  resources :gossips
  resources :users
  resources :cities, only: [:show]
  resources :sessions


end
