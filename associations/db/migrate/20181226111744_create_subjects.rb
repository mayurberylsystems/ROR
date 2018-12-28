class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :student_id
      t.string :teacher_id

      t.timestamps
    end
  end
end
