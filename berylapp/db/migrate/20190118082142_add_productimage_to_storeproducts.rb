class AddProductimageToStoreproducts < ActiveRecord::Migration
  def change
    add_column :storeproducts, :productimage, :string
  end
end
