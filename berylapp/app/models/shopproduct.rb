class Shopproduct < ActiveRecord::Base
	validates_uniqueness_of :title 
	belongs_to :shop
	has_many :shopproductimages
end
