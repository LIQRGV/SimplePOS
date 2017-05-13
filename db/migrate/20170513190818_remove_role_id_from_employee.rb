class RemoveRoleIdFromEmployee < ActiveRecord::Migration
  def change
    remove_column :employees, :role_id, :integer
  end
end
