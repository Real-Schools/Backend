require 'bcrypt'

class ChangePasswordConstraintsOnStudents < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :encrypted_password, :string, default: BCrypt::Password.create('password'), null: true
  end
end
