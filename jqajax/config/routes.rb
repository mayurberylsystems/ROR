Rails.application.routes.draw do
  resources :ajax
  get 'ajax/new'
  root to: 'ajax#new'

  post "/save-accounts" => "ajax#save_accounts"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
