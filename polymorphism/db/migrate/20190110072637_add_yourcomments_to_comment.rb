class AddYourcommentsToComment < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments , :yourcomments , :string
  end
end
