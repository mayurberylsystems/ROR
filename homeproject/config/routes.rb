Rails.application.routes.draw do
  devise_for :users
	resources :patients
	resources :doctors
	resources :appointments
	root 'doctors#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
