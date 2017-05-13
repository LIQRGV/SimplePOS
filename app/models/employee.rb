class Employee < ActiveRecord::Base
  has_many :employee_role
  has_many :role, through: :employee_role

  def is_owner?
    role.each do |role|
      return true if role.role_name == 'owner'
    end
    return false
  end
end
