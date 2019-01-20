class CreateShopproducts < ActiveRecord::Migration
  def change
    create_table :shopproducts do |t|
      t.references :shop, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.string :price

      t.timestamps null: false
    end
  end
end
