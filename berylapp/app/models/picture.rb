class Picture < ActiveRecord::Base
	validates_uniqueness_of :product_id
	mount_uploader :correspondingimage, CorrespondingimageUploader

	
end
