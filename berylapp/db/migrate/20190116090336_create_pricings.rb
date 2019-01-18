class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.integer :product_id
      t.integer :price
      t.integer :compare_at_price
      t.integer :cost_per_item

      t.timestamps null: false
    end
  end
end
