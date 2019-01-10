class AddContactToPatient < ActiveRecord::Migration[5.2]
  def change
  	add_column :patients , :contact , :string
  end
end
