class Productshopify < ActiveRecord::Base
	validates_uniqueness_of :title
	belongs_to :shop
	has_many :productsimage
end
