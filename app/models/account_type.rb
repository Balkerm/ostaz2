class AccountType < ActiveRecord::Base
  attr_accessible :description, :name, :id
  has_many :Accounts 
end
