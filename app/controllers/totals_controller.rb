class TotalsController < ApplicationController
	def index
	@accounts = Account.getTotals
	#@assets = Account.getTotalAssets
	#@totalsHash = Account.totalsHash
	end
def new
end
def edit
	
end
def create
	@accounts = Account.createTotals(params[:amount])
	render action: "index"
end
def update
end

end
