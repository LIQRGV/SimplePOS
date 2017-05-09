FactoryGirl.define do
  factory :employee do
    username "some_username"
    employee_name "some_name"
    position "some_position"
    password "some_password"
  end

  factory :employee_owner do
    username "pemilik_username"
    employee_name "pemilik_name"
    position "pemilik"
    password "pemilik_password"
  end

  factory :employee_supervisor do
    username "supervisor_username"
    employee_name "supervisor_name"
    position "supervisor"
    password "supervisor_password"
  end

  factory :employee_cashier do
    username "kasir_username"
    employee_name "kasir_name"
    position "kasir"
    password "kasir_password"
  end
end
