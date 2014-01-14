# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Creating Account types'
AccountType.delete_all
AccountType.create!(id: 1,name: 'Assets',description: 'Assets')
AccountType.create!(id: 2,name: 'Liabilities',description: 'Liabilities')
AccountType.create!(id: 3, name: 'Equity',description: 'Equity')
AccountType.create!(id: 4,name: 'Expenses',description: 'Expenses')
puts 'Account Types : [Assets, Liabilities, Equity, Expenses ] created.'

puts 'CREATING ROLES'
Role.delete_all
Role.create([
  { :name => 'Owner' }, 
  { :name => 'Accountant'}, 
  { :name => 'DataEntry'}], :without_protection => true)
puts 'Roles [Owner , Accountant	,DataEntry] created.'	   
		   
puts 'SETTING UP DEFAULT USERS LOGIN'
User.delete_all
user1 = User.create! :name => 'Sameh El-Ansary', :email => 'sameh@gmail.com', :password => 'password', :password_confirmation => 'password'
user2 = User.create! :name => 'Basma Alkerm', :email => 'basma@gmail.com', :password => 'password', :password_confirmation => 'password'
user3 = User.create! :name => 'Sara Alkerm', :email => 'sara@gmail.com', :password => 'password', :password_confirmation => 'password'

user1.add_role  :Owner
user2.add_role :Accountant
user3.add_role :DataEntry

puts 'New user created: ' << user1.name << 'with role: Owner'
puts 'New user created: ' << user2.name << 'with role : Accountant'
puts 'New user created: ' << user3.name << 'with role : DataEntry'

puts 'SETTING UP Main accounts for Accountant Basma Alkerm '
puts 'Initial Equity == 20000'
Account.createTotals(20000,user2)


