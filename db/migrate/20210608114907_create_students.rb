class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :gender
      t.date   :date_of_birth
      t.string :email
      t.timestamps
    end
  end
end
