class AddImageToProductimgs < ActiveRecord::Migration
  def change
    add_column :productimgs, :image, :string
  end
end
