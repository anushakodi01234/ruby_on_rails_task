class AddStudentIdToMarks < ActiveRecord::Migration[6.1]
  def change
    add_column :marks, :student_id, :int
  end
end
