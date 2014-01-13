Feature: Manage Transactions
  In order to keep track of my transactions
  As a user
  I want to add and view transactions
  

 Scenario: Successfully add transaction
	Given I am logged in as accountant
	And I have main accounts with initial eqity "2000"
	And I have the following accounts
	| name                    | balance |
	| acc1                    | 200     |
	| acc2                    | 0       | 
	When I create new transaction from "acc1" to "acc2" by 100
	Then I should see transaction saved message	
	
	
Scenario: Failed to add transaction
	Given I am logged in as accountant
	And I have main accounts with initial eqity "2000"
	And I have the following accounts
	| name                    | balance |
	| acc1                    | 200     |
	| acc2                    | 0       | 
	When I create new transaction from "acc1" to "acc2" by 300
	Then I should see no enough funds message	
	
