class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :facebook
      t.boolean :twitter
      t.boolean :instagram
      t.boolean :gmail

      t.timestamps
    end
  end
end
