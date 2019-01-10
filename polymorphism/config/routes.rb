Rails.application.routes.draw do
	root 'welcome#index'
  
  
	resources :events
	
	resources :comments

	resources :articles

	devise_for :endusers

	authenticated :endusers do
    root 'events#index', as: :authenticated_root
    resources :events , only: [:index, :show, :new, :create, :edit, :update]
    resources :articles, only: [:index, :show, :new, :create, :edit, :update]
  end
end
