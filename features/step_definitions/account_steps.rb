################### Given #################################3
Given /^I have main accounts with initial eqity (.*)$/ do |e1|
	create_main_accounts(e1)
end

Given /^I am logged in as accountant$/ do
	@user = create_user
	sign_in
end

Given /the following account Types exist/ do |types_table|
  types_table.hashes.each do |type|
  AccountType.create(:name=> type[:name],:id => type[:id])
  end
end

Given /I have the following accounts/ do |accounts_table|
  accounts_table.hashes.each do |account|
	create_account(account[:name],account[:balance])
  end
end

Given /I have a sub account "(.*)"$/ do |e1|
	create_account(e1,0)
end
################### When #################################3
When /^I create new account "(.*)" with balance (.*)$/ do |e1,e2|
create_account(e1,e2)
end 

When /^I go to the list accounts page$/ do
	visit accounts_path
end
################### Then #################################3
Then /I should see "(.*)" / do |e1|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  find('table#accounts tbody').text.should match(/(.*)(#{e1})(.*)/)
end
Then /^I should see a successful create account message$/ do
	page.should have_content "Account was successfully created."
end

Then /^I should see "(.*)"$/ do |e1|
	page.should have_content e1
end

#When /^(?:|I )go to (.+)$/ do |page_name|
 # visit get_path(page_name)
#end

def create_main_accounts(amount)
	#@user = FactoryGirl.create(:accountant)
	@main_assets = FactoryGirl.create(:account_main_assets,:balance => amount)
	
	#@main_assets.user = @user
	@main_liabilities = FactoryGirl.create(:account_main_liabilities)
	#@main_liabilities.user = @user
	@main_expenses = FactoryGirl.create(:account_main_expenses)
	#@main_expenses.user = @user
	@main_equity = FactoryGirl.create(:account_main_equity,:balance => amount)
	#@main_equity.user = @user
	#@main_equity.balance = amount
end

def create_account(name,balance)
   visit new_account_path
   fill_in "account_name", :with => name
   fill_in "account_balance", :with => balance
   select("Expenses", :from => "account_AccountType_id")
   click_button "Create Account"
end





