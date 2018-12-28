class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.string :name
      t.string :address
      t.string :email
      t.text :queries

      t.timestamps
    end
  end
end
