Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :doctors do
    resources :patients
    resources :doctors
  end

  namespace :doctors do
  	resources :appointments
  end

  devise_for :doctors

  authenticated :doctor do
    root 'doctors/doctors#index', as: :authenticated_root
  end

  post "/register" => "doctors/doctors#sign_up"

  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
