class Productimg < ActiveRecord::Base
	attr_accessor :product_id, :image, :remote_image_url
	belongs_to :product
	mount_uploader :image, ImageUploader

end
