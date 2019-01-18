class ProductShop < ActiveRecord::Base
  belongs_to :product
  belongs_to :shop
end
