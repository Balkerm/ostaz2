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
	@totals=Hash.new
	@accounts = Account.where("name like ?","total%")
	
	@accounts.each do |account|		
		@totals[account.name] = account
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
  def self.addAndUpdateTotals(acc)
	@totals = Account.totalsHash
	@error=""
	if(acc.AccountType.id == 1 || acc.AccountType.id == 4)
		@total_Assets = @totals['total_Assets']
		@total_Assets.balance = @total_Assets.balance - acc.balance 
		if(@total_Assets.balance <0)
			@error="There is no enough funds for the initial balance"
		else
			@total_Exp = @totals['total_Expenses']
			@total_Exp.balance = @total_Exp.balance + acc.balance
			if(acc.save)
				@total_Exp.save
				@total_Assets.save
			end
		end
	elsif(acc.AccountType.id == 3)
		@total_eq = @totals['total_Equity']
		@total_eq.balance = @total_eq.balance + acc.balance
		@total_ass = @totals['total_Assets']
		@total_ass.balance = @total_ass.balance + acc.balance
		if(acc.save)
			@total_eq.save
			@total_ass.save
		end
	elsif(acc.AccountType.id == 2)
		@total_liab = @totals['total_Liabilities']
		@total_liab.balance = @total_liab.balance + acc.balance
		@total_Exp = @totals['total_Expenses']
		@total_Exp.balance = @total_Exp.balance + acc.balance
		if(acc.save)
				@total_Exp.save
				@total_liab.save
		end
	else
		@error="Unknown account type"
	end		
	@error	
  end
  
end
