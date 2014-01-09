# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme' 
  end
  
  factory :accountant, parent: :user do
	roles [FactoryGirl.create(:role_accountant)]
  end
  
  factory :owner, parent: :user do
	roles [FactoryGirl.create(:role_owner)]
  end
end
