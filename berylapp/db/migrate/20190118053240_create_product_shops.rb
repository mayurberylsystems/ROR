class CreateProductShops < ActiveRecord::Migration
  def change
    create_table :product_shops do |t|
      t.references :product, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
