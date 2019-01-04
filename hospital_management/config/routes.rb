Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :doctors do
    get 'patients/index'
  end

  namespace :doctors, path: 'users', as: 'user' do
  	resources :appointments
  end

  devise_for :doctors

  authenticated :doctor do
    root 'doctors/appointments#index', as: :authenticated_root
  end
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
