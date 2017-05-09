class CreateJoinTableEmployeeRole < ActiveRecord::Migration
  def change
    create_join_table :employees, :roles do |t|
      t.integer :role_id, unique: true
      t.index [:role_id, :employee_id]
    end
  end
end
