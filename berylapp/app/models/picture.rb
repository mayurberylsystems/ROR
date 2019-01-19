class Picture < ActiveRecord::Base
	mount_uploader :correspondingimage, CorrespondingimageUploader


end
