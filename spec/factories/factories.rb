FactoryGirl.define do
  factory :role_accountant, class: Role do
    name 'Accountant'
	initialize_with { Role.find_or_create_by_name('Accountant')}
  end
  
  factory :role_owner , class: Role do
    name 'Owner'
	initialize_with { Role.find_or_create_by_name('Owner')}
  end

################################################################################
  factory :account_type_assets, class: AccountType do
	ignore do
		balance  0 
	end
	name 'Assets'
	initialize_with { AccountType.find_or_create_by_name('Assets')}
  end
  
  factory :account_type_liabilities, class: AccountType do
	name 'Liabilities'
	initialize_with { AccountType.find_or_create_by_name('Liabilities')}
  end
  factory :account_type_equity, class: AccountType do
  ignore do
		balance  0 
	end
	name 'Equity'
	initialize_with { AccountType.find_or_create_by_name('Equity')}
  end
  factory :account_type_expenses, class: AccountType do
	name 'Expenses'
	initialize_with { AccountType.find_or_create_by_name('Expenses')}
  end
#################################################################################
  factory :user , class: User do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme' 
  end
  
  factory :accountant , class: User  ,parent: :user do
	roles {[FactoryGirl.create(:role_accountant)]}
  end
  
  factory :owner ,class: User , parent: :user do
	roles {[FactoryGirl.create(:role_owner)]}
  end
############################################################################3
  factory :account_main_assets, class: Account do
	name  'total_Assets'
	#AccountType  AccountType.find_by_name('Assets')
    AccountType  {FactoryGirl.create(:account_type_assets)}
    #user  FactoryGirl.create(:accountant) 
	balance  0
  end
  factory :account_main_liabilities, class: Account do
    name  'total_Liabilities'	
	#AccountType  AccountType.find_by_name('Liabilities')
    AccountType  {FactoryGirl.create(:account_type_liabilities)}
    #user  FactoryGirl.create(:accountant) 
	balance  0
  end
  factory :account_main_equity, class: Account do
    name  'total_Equity'	
    #AccountType  AccountType.find_by_name('Equity')
	AccountType  {FactoryGirl.create(:account_type_equity)}
    #user  FactoryGirl.create(:accountant) 
	balance  0
  end
  factory :account_main_expenses, class: Account do
    name  'total_Expenses'	
	#AccountType  AccountType.find_by_name('Expenses')
    AccountType  {FactoryGirl.create(:account_type_expenses)}
    #user  FactoryGirl.create(:accountant) 
	balance  0
  end
  factory :account_assets, class: Account , parent: :account_main_assets do
	ignore do
		balance  0 
		name  'acc_expensses'
	end
	#AccountType  AccountType.find_by_name('Assets')
	AccountType   {FactoryGirl.create(:account_type_assets)}
  end
  
  factory :account_liabilities, class: Account, parent: :account_main_liabilities do
    ignore do
		balance  0 
		name  'acc_expensses'
	end
	#AccountType  AccountType.find_by_name('Liabilities')
	AccountType   {FactoryGirl.create(:account_type_liabilities)}
  end
  factory :account_equity, class: Account,parent: :account_main_equity do
    ignore do
		balance  0 
		name  'acc_expensses'
	end	
	#AccountType  AccountType.find_by_name('Equity')
	AccountType  {FactoryGirl.create(:account_type_equity)}
	
  end
  factory :account_expenses, class: Account, parent: :account_main_expenses do
	ignore do
		balance  0 
		name  'acc_expensses'
	end
	#AccountType  AccountType.find_by_name('Expenses')
	AccountType  {FactoryGirl.create(:account_type_expenses)}
  end   
end

