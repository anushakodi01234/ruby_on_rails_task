class AddSubjectIdToMarks < ActiveRecord::Migration[6.1]
  def change
    add_column :marks, :subject_id, :int
  end
end
