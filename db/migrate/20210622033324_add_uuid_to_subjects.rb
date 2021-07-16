class AddUuidToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :uuid, :string
  end
end
