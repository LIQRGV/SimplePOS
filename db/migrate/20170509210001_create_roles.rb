class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.index :role_id
      t.string :role_name
    end
  end
end
