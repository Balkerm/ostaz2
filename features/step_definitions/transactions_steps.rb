When /^I create new transaction from "(.*)" to "(.*)" by (.*)/ do |e1,e2,e3|
	create_transaction(e1,e2,e3)
end
Then /^I should see no enough funds message$/ do
	page.should have_content "Invalid Transaction: From account doesn't have enough funds."
end
Then /^I should see transaction saved message$/ do
	page.should have_content "Transaction was successfully saved."	
end	

def create_transaction(from,to,amount)
	visit new_transaction_path
	fill_in "transaction_amount", :with => amount
    select(from, :from => "transaction_from_id")
	select(to, :from => "transaction_to_id")
    click_button "Create Transaction"
end