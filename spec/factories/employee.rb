FactoryGirl.define do
  factory :employee do
    username "some_username"
    employee_name "some_name"
    password "some_password"
    role_id -1
  end

  factory :employee_owner do
    username "pemilik_username"
    employee_name "pemilik_name"
    password "pemilik_password"
    role_id 1
  end

  factory :employee_supervisor do
    username "supervisor_username"
    employee_name "supervisor_name"
    password "supervisor_password"
    role_id 2
  end

  factory :employee_cashier do
    username "kasir_username"
    employee_name "kasir_name"
    password "kasir_password"
    role_id 3
  end
end
