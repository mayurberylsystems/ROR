class Storeproduct < ActiveRecord::Base
	mount_uploader :productimage, ProductimageUploader
end
