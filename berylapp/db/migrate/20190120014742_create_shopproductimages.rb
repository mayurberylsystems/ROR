class CreateShopproductimages < ActiveRecord::Migration
  def change
    create_table :shopproductimages do |t|
      t.references :shopproduct, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
