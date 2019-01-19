class CreateShopifyproducts < ActiveRecord::Migration
  def change
    create_table :shopifyproducts do |t|
      t.string :title
      t.text :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
