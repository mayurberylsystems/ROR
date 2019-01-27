Rails.application.routes.draw do
	resources 'forms'
  get 'form/new'
  get 'form/edit'
  get 'form/show'
  root 'form#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
