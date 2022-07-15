class RemoveIndexOnEmailFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_index :students, :email
  end
end
