Rails.application.routes.draw do
  require 'sidekiq/web'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Sidekiq::Web => '/sidekiq'

  devise_scope :user do
    post 'sign_up/identity' => 'users/registrations#initialize_user', as: :initialize_user
    get 'sign_up/activation' => 'users/registrations#activation', as: :user_activation
    post 'sign_up/activate_user' => 'users/registrations#activate_user', as: :activate_user
    get 'users/check_email' => 'users/registrations#check_email', as: :check_email
    get 'users/change_states' => 'users/registrations#change_states', as: :change_states
  end

  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => 'users/passwords'}

  namespace :admin, :path => "/", as: "" do
    get '/change_category' => 'product_categories#change_category'
    post '/upload_csv' => 'product_categories#upload_csv'
    post '/create_product_category' => 'product_categories#create', as: 'create_product_category'
  end

  namespace :brand, :path => "/", as: "brand" do
    get '/dashboard' => 'home#dashboard', as: 'dashboard'

    post '/upload_item' => 'items#upload_item', as: 'upload_item'
    get '/change_catg' => 'items#change_catg', as: 'change_category'
    get '/change_sub_catg' => 'items#change_sub_catg', as: 'change_sub_category'
    post '/save_items' => 'items#save', as: 'save_items'
    get '/item/details' => 'items#details', as: 'item_details'
    post '/upload_item_images' => 'items#upload_item_images', as: 'upload_item_images'
    get '/download_items_zip' => 'items#download_zip', as: 'download_items_zip'
    get '/add_item_images' => 'items#add_item_images', as: 'add_item_images'
    post '/save_item_images' => 'items#save_item_images', as: 'save_item_images'
    get '/download_example_items' => 'items#download_example', as: 'download_example_items'
    get '/selling' => 'items#selling', as: 'selling_items'
    get '/update-selling-list' => 'items#update_list', as: 'update_items_list'
    resources :items

    get '/settings' => 'settings#index', as: 'settings'
    post '/update_settings' => 'settings#update', as: 'update_settings'

    #get '/integrations' => 'integrations#index'
    #post '/integrations/sync_shopify' => 'integrations#sync', as: 'sync_shopify'
  end

  namespace :seller, :path => "/", as: "seller" do
    get '/home' => 'home#dashboard', as: 'dashboard'

    get '/marketplace' => 'marketplace#index', as: 'marketplace'
    get '/item/:id/details' => 'marketplace#item_details', as: 'item_details'
    get '/item/:id/add_to_store' => 'marketplace#add_to_store', as: 'add_item_to_store'
    get '/marketplace/category/:catg_id' => 'marketplace#catg_items', as: 'catg_items'
    get '/marketplace/:catg_id/:sub_catg_id' => 'marketplace#catg_items', as: 'sub_catg_items'
    get '/marketplace/:catg_id/:sub_catg_id/:prod_catg_id' => 'marketplace#catg_items', as: 'product_catg_items'
    #get '/marketplace/catg_items' => 'marketplace#catg_items', as: 'catg_items'
    post '/marketplace/search-items' => 'marketplace#search', as: 'search_market_items'
    get '/marketplace/typehead-search-items' => 'marketplace#typehead_search'
    get '/marketplace/get_item' => 'marketplace#item'
    get 'marketplace/autocomplete_brand_detail_company_name', as: :autocomplete_brand_name
    get '/marketplace/search-brands' => 'marketplace#search_brands', as: 'search_brands'

    get '/store' => 'items#index', as: 'items'
    get '/item/:id/discontinue' => 'items#initiate_discontinue', as: 'initiate_discontinue_item'
    post '/item/discontinued' => 'items#discontinued', as: 'discontinued_item'
    match '/update-list' => 'items#update_list', as: 'update_items_list', via: [:get, :post]

    get '/profile' => 'settings#index', as: 'settings'
    post '/update-settings' => 'settings#update', as: 'update_settings'
  end

  namespace :shopify, :path => "/", as: "shopify" do
    get '/integrations' => 'main#index', as: 'integrations'

    get '/shopify' => 'integrations#index', as: ''
    post '/integrations/sync_shopify' => 'integrations#sync', as: 'sync'
    post '/integrations/delete_shopify' => 'integrations#delete', as: 'delete'

    get '/integrations/update_products' => 'products#update_list', as: 'update_products'

    get 'apps/autocomplete_app_name', as: :autocomplete_app_name
    get '/apps/show' => 'apps#show', as: 'apps_show'
    post '/apps/search' => 'apps#search', as: 'apps_search'
    post '/apps/save_recommended_app' => 'apps#save_recommended_app', as: 'save_recommended_app'

    post '/shopify/webhooks/:type' => 'webhooks#receive'
    post '/shopify/webhooks/products_update' => 'webhooks#products_update'
  end
  mount ShopifyApp::Engine, at: '/shopify'

  #get '/shopify' => 'shopify#index'

  devise_scope :user do
    authenticated :user do
      root 'home#user', as: :user_home
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
