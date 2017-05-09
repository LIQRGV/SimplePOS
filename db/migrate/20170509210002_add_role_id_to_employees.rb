class AddRoleIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :role_id, :integer
  end
end
