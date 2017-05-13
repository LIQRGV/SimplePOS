class EmployeeRole < ActiveRecord::Base
  self.table_name = "employees_roles"
  belongs_to :employee
  belongs_to :role
end
