class AddCorrespondingimageToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :correspondingimage, :string
  end
end
