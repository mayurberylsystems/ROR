Rails.application.routes.draw do

	resources :events
	
	resources :comments

	resources :articles
end
