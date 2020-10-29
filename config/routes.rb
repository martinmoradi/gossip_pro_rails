Rails.application.routes.draw do

  root to:'static_pages#home', as: 'home'
  get 'static_pages/team', to: 'static_pages#team'
  get 'static_pages/contact', to: 'static_pages#contact'
  get 'welcome/:name', to: 'static_pages#welcome'
  get 'static_pages/gossip/:gossip_id', to: 'static_pages#gossip', as: 'gossip'
  get 'static_pages/author/:author_id', to: 'static_pages#author', as: 'author'

  resources :gossips
  resources :users
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
end
