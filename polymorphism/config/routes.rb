Rails.application.routes.draw do
  # devise_for :signedusers

	resources :events

	resources :comments
	root 'comments#new'
 
	resources :articles
	
	
end
