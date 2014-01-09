FactoryGirl.define do
  factory :role_accountant, class: Role do
    name 'Accountant'
  end
  
  factory :role_owner , class: Role do
    name 'Owner'
  end
end