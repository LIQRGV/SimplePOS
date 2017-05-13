require 'rails_helper'

describe Employee, type: :model do
  let(:owner) do
    employee = create :employee, username: 'owner', password: 'password'
    role = create :role_owner
    role.save
    employee.role = [role]
    employee.save
    Employee.find(employee.id)
  end

  let(:supervisor) do
    employee = create :employee, username: 'supervisor', password: 'password'
    role = create :role_supervisor
    role.save
    employee.role = [role]
    employee.save
    Employee.find(employee.id)
  end

  let(:cashier) do
    employee = create :employee, username: 'cashier', password: 'password'
    role = create :role_cashier
    role.save
    employee.role = [role]
    employee.save
    Employee.find(employee.id)
  end

  describe "#is_owner?" do
    it "will return true if and only if the employee is owner" do
      expect(owner.is_owner?).to eq true
      [supervisor, cashier].each do |other_role|
        expect(other_role.is_owner?).to eq false
      end
    end
  end
end
