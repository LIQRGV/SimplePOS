FactoryGirl.define do
  factory :role do
    role_name "some_role"
  end

  factory :role_owner, class: Role do
    role_name "owner"
  end

  factory :role_supervisor, class: Role do
    role_name "supervisor"
  end

  factory :role_cashier, class: Role do
    role_name "cashier"
  end
end
