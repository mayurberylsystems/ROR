class CreateSocialmedia < ActiveRecord::Migration[5.2]
  def change
    create_table :socialmedia do |t|
      t.string :name
      t.string :total_users

      t.timestamps
    end
  end
end
