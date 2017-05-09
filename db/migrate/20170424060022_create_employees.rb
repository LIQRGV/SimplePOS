class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.index :employee_id
      t.string :username
      t.string :employee_name
      t.string :position
      t.string :password, limit: 32 #this will hashed with md5 (sigh)
    end
  end
end
