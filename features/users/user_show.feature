Feature: Show Users
  As the Owner of the application
  I want to see registered users listed on the users page
  so I can know if the application has users

  Background:
      Given the basic roles are defined
	  
	  
    Scenario: Viewing users
      Given I am logged in as owner
      When I look at the list of users
      Then I should see my name
