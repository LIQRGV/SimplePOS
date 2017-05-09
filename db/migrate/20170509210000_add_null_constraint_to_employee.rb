class AddNullConstraintToEmployee < ActiveRecord::Migration
  def up
    change_table :employees do |t|
      t.change :username, :string, null: false
      t.change :employee_name, :string, null: false
      t.change :position, :string, null: false
      t.change :password, :string, null: false
    end
  end

  def down
    change_table :employees do |t|
      t.change :username, :string, null: true
      t.change :employee_name, :string, null: true
      t.change :position, :string, null: true
      t.change :password, :string, null: true
    end
  end
end
