class Productsimage < ActiveRecord::Base
  belongs_to :productshopify
  mount_uploader :image, ImageUploader
end
