Rails.application.routes.draw do
	root 'welcome#index'
  
  
	resources :events
	
	resources :comments

	resources :articles

	devise_for :endusers

	authenticated :endusers do
		resources :events
    root 'events#index', as: :authenticated_root
  end
end
