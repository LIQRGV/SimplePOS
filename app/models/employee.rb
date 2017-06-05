class Employee < ActiveRecord::Base
  has_many :employee_role
  has_many :role, through: :employee_role

  def is_owner?
    role.each do |role|
      return true if role.role_name == 'owner'
    end
    return false
  end

  def is_supervisor?
    role.each do |role|
      return true if role.role_name == 'supervisor'
    end
    return false
  end

  def is_cashier?
    role.each do |role|
      return true if role.role_name == 'cashier'
    end
    return false
  end

  def stringify_roles
    role.map(&:role_name).join(",")
  end
end
