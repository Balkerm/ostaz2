Feature: Manage Accounts
  In order to keep track of my accounts
  As a user
  I want to create 'and' manage accounts

Scenario: Successfully Add account
	Given I am logged in as accountant
	And I have main accounts with initial eqity "15000"	
	When I create new account "test acc" with balance "400"
	Then I should see a successful create account message
	
Scenario: Failed To Add account
	Given I am logged in as accountant
	And I have main accounts with initial eqity "200"	
	When I create new account "test acc" with balance "400"	
	Then I should see "There is no enough funds for the initial balance, maximum allowed = 200.0"	
	
Scenario: List accounts
	Given I am logged in as accountant
	And I have main accounts with initial eqity "2000"
	And I have a sub account "my account"
    When I go to the list accounts page
    Then I should see "my account"