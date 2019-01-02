Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcomes/index'
  get 'dposts/new'
  resources :dposts
  resources :welcome
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
