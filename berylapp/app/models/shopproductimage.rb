class Shopproductimage < ActiveRecord::Base
  belongs_to :shopproduct
  mount_uploader :image, ImageUploader
end
