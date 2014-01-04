Feature: Manage Transactions
  In order to keep track of my transactions
  As a user
  I want to add and view transactions
  
Background: accounts have been added to database

  Given the following account Types exist:
  | name                      | id |
  | Assets                    | 1  |
  | Liabilities               | 2  |
  | Equity                    | 3  |
  | Expenses                  | 4  |
  And the following accounts exist:
  | name                    | AccountType_id   | balance |
  | acc1                    | 1                | 100     |
  | acc2                    | 3                | 100     | 
  |total_Assets             | 1                | 300     |
  |total_Liabilities        | 2                | 0       |
  |total_Equity             | 3                | 400     |
  |total_Expenses           | 4                | 100     |
  
 Scenario: Successfully Add transaction
	When I go to the New Transaction page
	And I fill in the following:
     | transaction_description     | Test_Trans   |
     | transaction_amount          | 50           |
	And I select "acc2" from "transaction_from"
	And I select "acc1" from "transaction_to"
	And I press "Create Transaction"	
	Then I should see "Transaction was successfully saved."	
