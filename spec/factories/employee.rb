FactoryGirl.define do
  factory :employee do
    username "some_username"
    employee_name "some_name"
    password "some_password"
  end

  factory :employee_owner, class: Employee do
    username "pemilik_username"
    employee_name "pemilik_name"
    password "pemilik_password"
    after(:create) do |employee, evaluator|
      role = create :role_owner
      employee.role = [role]
      employee.save
    end
  end

  factory :employee_supervisor, class: Employee do
    username "supervisor_username"
    employee_name "supervisor_name"
    password "supervisor_password"
    after(:create) do |employee, evaluator|
      role = create :role_supervisor
      employee.role = [role]
      employee.save
    end
  end

  factory :employee_cashier, class: Employee do
    username "kasir_username"
    employee_name "kasir_name"
    password "kasir_password"
    after(:create) do |employee, evaluator|
      role = create :role_cashier
      employee.role = [role]
      employee.save
    end
  end
end
