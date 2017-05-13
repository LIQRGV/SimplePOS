class Role < ActiveRecord::Base
  has_many :employee_role
  has_many :employee, through: :employee_role
end
