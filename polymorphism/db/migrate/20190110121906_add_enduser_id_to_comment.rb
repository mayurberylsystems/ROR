class AddEnduserIdToComment < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments , :enduser_id , :integer
  end
end
