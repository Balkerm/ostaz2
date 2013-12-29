# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AccountType.delete_all
AccountType.create!(id: 1,name: 'Assets',description: 'Assets')
AccountType.create!(id: 2,name: 'Liabilities',description: 'Liabilities')
AccountType.create!(id: 3, name: 'Equity',description: 'Equity')
AccountType.create!(id: 4,name: 'Expenses',description: 'Expenses')
