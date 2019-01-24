Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'quickbooks#index'
  get 'quickbooks/authenticate'
  get 'quickbooks/oath_callback'
  post 'quickbooks/create_customer'
  post 'quickbooks/create_invoice'
  get 'quickbooks/credential'
end
