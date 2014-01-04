
And /the following accounts exist/ do |accounts_table|
  accounts_table.hashes.each do |account|
  Account.create(:name=> account[:name],:balance => account[:balance],:AccountType_id=> account[:AccountType_id])
  end
end
Given /the following account Types exist/ do |types_table|
  types_table.hashes.each do |type|
  AccountType.create(:name=> type[:name],:id => type[:id])
  end
end
Then /I should see "(.*)" / do |e1|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  find('table#accounts tbody').text.should match(/(.*)(#{e1})(.*)/)
end