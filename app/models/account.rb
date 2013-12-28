class Account < ActiveRecord::Base
  belongs_to :AccountType
  attr_accessible :AccountType_id, :balance, :description, :name
end
