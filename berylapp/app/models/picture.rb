class Picture < ActiveRecord::Base
	mount_uploader :correspondingimage, CorrespondingimageUploader
	validates_uniqueness_of :correspondingimage 

end
