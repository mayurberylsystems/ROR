class CreateProductimgs < ActiveRecord::Migration
  def change
    create_table :productimgs do |t|
      t.string :product_id

      t.timestamps null: false
    end
  end
end
