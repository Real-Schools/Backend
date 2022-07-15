class AddBioToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :bio, :text
  end
end
