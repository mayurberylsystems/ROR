class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage
  has_many :productshopifies
  has_many :shopproducts
end
