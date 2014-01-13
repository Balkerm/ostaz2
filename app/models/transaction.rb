class Transaction < ActiveRecord::Base
  belongs_to :from, :class_name => "Account"
  belongs_to :to, :class_name => "Account"
  attr_accessible :amount, :description,:id,:from_id,:to_id,:receipt
  has_many :accounts
  
  has_attached_file :receipt, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png" 
  #:styles => { :medium => "300x300>", :thumb => "100x100>" },
  
  validates_presence_of :from
  validates_presence_of :to
  def self.validateTransaction(trans)
	@error=""
	if(!trans.to.nil? && !trans.from.nil?)
	if(trans.to == trans.from)
		@error ="Invalid Transaction: From  and to accounts mustn't be the same."
	elsif(trans.amount.nil?)
		@error = "Invalid Transaction: please enter amount."
	elsif(trans.from.balance < trans.amount)
		@error = "Invalid Transaction: From account doesn't have enough funds."
	end
	end
	@error
  end
  def self.saveAndUpdateMainAccounts(transaction)
	@result = transaction.save
	if(@result)
		transaction.from.balance = transaction.from.balance-transaction.amount
		transaction.to.balance = transaction.to.balance+transaction.amount
		transaction.to.save
		transaction.from.save
		if(transaction.from.AccountType != transaction.to.AccountType)		
			handelFrom(transaction.from.AccountType,transaction.amount)
			handleTo(transaction.to.AccountType,transaction.amount)			
		end
	end
	return @result	
  end
  
  def self.handelFrom(type,amount)
	if(type.id == 1)
		Account.debitAssets(amount)
	elsif(type.id == 2)
		Account.debitLiabilities(amount)
	elsif(type.id == 3)
		Account.debitEquity(amount)
	elsif(type.id == 4)
		Account.debitExpenses(amount)
	else
	end
  end
  def self.handleTo(type,amount)
	if(type.id == 1)
		Account.creditAssets(amount)
	elsif(type.id == 2)
		Account.creditLiabilities(amount)
	elsif(type.id == 3)
		Account.creditEquity(amount)
	elsif(type.id == 4)
		Account.creditExpenses(amount)
	else
	end
  end
end
