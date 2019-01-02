class CreateDposts < ActiveRecord::Migration[5.2]
  def change
    create_table :dposts do |t|
      t.string :name
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
