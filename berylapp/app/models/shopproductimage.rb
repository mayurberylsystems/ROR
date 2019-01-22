class Shopproductimage < ActiveRecord::Base
validates_presence_of :shopproduct_id 


  belongs_to :shopproduct
  mount_uploader :image, ImageUploader



end
