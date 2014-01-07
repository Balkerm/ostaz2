Feature: Manage Accounts
  In order to keep track of my accounts
  As a user
  I want to create and manage accounts
  
  
Background: accounts have been added to database

  Given the following account Types exist:
  | name                      | id |
  | Assets                    | 1  |
  | Liabilities               | 2  |
  | Equity                    | 3  |
  | Expenses                  | 4  |
  And the following accounts exist:
  | name                    | AccountType_id   | balance |
  | acc1                    | 1                | 0       |
  | acc2                    | 3                | 0       | 
  |total_Assets             | 1                | 300     |
  |total_Liabilities        | 2                | 0       |
  |total_Equity             | 3                | 300     |
  |total_Expenses           | 4                | 0       |
  
Scenario: List accounts
    When I go to the list accounts page
    Then I should see "acc1"
    And I should see "acc2"
	
Scenario: Successfully Add account
	When I go to the New Account page 
	And I fill in the following:
     | account_name           | Test_Acc   |
     | account_balance        | 250        |
     | account_description    | Test_Desc  |     
	And I select "Expenses" from "account_AccountType_id"
	And I press "Create Account"
	Then I should be on the show account page for "Test_Acc"
	And I should see "Name: Test_Acc"
	And I should see "Description: Test_Desc"
	And I should see "Balance: 250.0"
	And I should see "Accounttype: Expenses"

Scenario: Failed To Add account
	When I go to the New Account page 
	And I fill in the following:
     | account_name           | Test_Acc   |
     | account_balance        | 350        |
     | account_description    | Test_Desc  |     
	And I select "Expenses" from "account_AccountType_id"
	And I press "Create Account"	
	Then I should see "There is no enough funds for the initial balance, maximum allowed = 300.0"	
	