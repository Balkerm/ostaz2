class Account < ActiveRecord::Base
  belongs_to :AccountType
  attr_accessible :AccountType_id, :balance, :description, :name
  validates_presence_of :AccountType
  
  def self.getTotals
		@account = Account.where("name like ?","total%")
  end
  def self.getTotalsArr
	@accounts =[]
		@asst_total = Account.find_by_name('Assets_total')
		unless @asst_total.nil?
			@accounts << @asst_total
		end
		@liab_total = Account.find_by_name('Liabilities_total')
		unless @liab_total.nil?
			@accounts << @liab_total
		end
		@Eq_total = Account.find_by_name('Equity_total')
		unless @Eq_total.nil?
			@accounts << @Eq_total
		end
		@Exp_total = Account.find_by_name('Expenses_total')
		unless @Exp_total.nil?
			@accounts << @Exp_total
		end	
		@accounts
  end
  
  def self.getTotalAssets
	@all_assets = Account.find_all_by_AccountType_id(AccountType.find_by_id(1))
	@total_balance = 0
	@all_assets.each do |acc|
		@total_balance = @total_balance + acc.balance
	end
	@total_balance
  end
  
  def self.totalsHash
	@types = AccountType.all
	@totals=Hash.new
	@types.each do |type|
		@accounts = Account.find_all_by_AccountType_id(type)
		@total_balance = 0.0
		@accounts.each do |acc|
			if (!acc.balance.nil?)
				@total_balance = @total_balance + acc.balance
			end
		end
		@totals[type.name] = @total_balance
	end
	@totals	
  end
  def self.createTotals(amount)	
	#Account.where(Account.arel_table[:name].matches('%total')).destroy_all
	@types = AccountType.all
	@all=[]
	@types.each do |type|
		@account = Account.new
		@account.name = "total_"+type.name
		@account.description = "The sum of all current "+type.name+"s."
		@account.AccountType = type
		if(type.name == "Assets" || type.name == "Equity")
			@account.balance = amount
		else
			@account.balance = 0.0
		end
		@account.save		
		@all << @account
	end
	@all
	
  end
  
end
