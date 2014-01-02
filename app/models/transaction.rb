class Transaction < ActiveRecord::Base
  belongs_to :from, :class_name => "Account"
  belongs_to :to, :class_name => "Account"
  attr_accessible :amount, :description,:id,:from,:to
  has_many :accounts
end
