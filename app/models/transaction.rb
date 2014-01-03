class Transaction < ActiveRecord::Base
  belongs_to :from, :class_name => "Account"
  belongs_to :to, :class_name => "Account"
  attr_accessible :amount, :description,:id,:from,:to
  has_many :accounts
  validates_presence_of :from
  validates_presence_of :to
  def validateTransaction(trans)
	if(trans.to == trans.from)
	elsif(trans.from.balance < trans.amount)
	end
  end
end
