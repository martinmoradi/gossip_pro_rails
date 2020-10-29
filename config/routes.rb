Rails.application.routes.draw do
  
  root to:'static_pages#home', as: 'home'

  resources :gossips
  resources :users
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'static_pages/team', to: 'static_pages#team'
  get 'static_pages/contact', to: 'static_pages#contact'
  get 'welcome/:name', to: 'static_pages#welcome'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy'



end
