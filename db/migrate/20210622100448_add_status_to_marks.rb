class AddStatusToMarks < ActiveRecord::Migration[6.1]
  def change
    add_column :marks, :status, :string
  end
end
