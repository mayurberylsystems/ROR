class AddImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image, :strings
  end
end
