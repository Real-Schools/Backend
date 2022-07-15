class RemoveEmailConstraintFromStudents < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :email, :string, null: true
  end
end
