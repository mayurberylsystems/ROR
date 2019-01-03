class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :age
      t.string :emailid
      t.integer :contact
      t.string :address

      t.timestamps
    end
  end
end
