class CreateProductshopifies < ActiveRecord::Migration
  def change
    create_table :productshopifies do |t|
      t.references :shop, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
