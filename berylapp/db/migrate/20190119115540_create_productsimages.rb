class CreateProductsimages < ActiveRecord::Migration
  def change
    create_table :productsimages do |t|
      t.references :productshopify, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
