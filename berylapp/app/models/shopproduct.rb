class Shopproduct < ActiveRecord::Base
  belongs_to :shop
  has_many :shopproductimages
end
