class CreateJoinTablePostUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :Posts, :Users do |t|
      t.index [:post_id, :user_id]
      t.index [:user_id, :post_id]
    end
  end
end
