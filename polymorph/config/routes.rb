Rails.application.routes.draw do
  resources :posts
  resources :events
  resources :comments
  resources :users

  root 'events#new'
end
