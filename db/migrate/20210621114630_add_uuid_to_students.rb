class AddUuidToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :uuid, :string
  end
end
