class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  before_filter :authenticate_user!
  load_and_authorize_resource  
  def index
    @transactions = Transaction.accessible_by(current_ability)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = Transaction.new
	@accounts = @account = Account.where("name not like ?","total%").accessible_by(current_ability)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
	@accounts = @account = Account.where("name not like ?","total%").accessible_by(current_ability)
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  def create
	@transaction = Transaction.new
	@acc_from = Account.find_by_id(params[:transaction][:from_id])
	@acc_to = Account.find_by_id(params[:transaction][:to_id])	
    @transaction.amount = params[:transaction][:amount]
	@transaction.description = params[:transaction][:description]
	@transaction.to = @acc_to
	@transaction.from = @acc_from
	@transaction.receipt = params[:transaction][:receipt]
	@error = Transaction.validateTransaction(@transaction) 
	if(@error != "")
		@accounts  = Account.where("name not like ?","total%").accessible_by(current_ability)
		respond_to do |format|
			format.html { render action: "new" }
			format.json { render json: @transaction.errors, status: :unprocessable_entity }
		end
		return
	end
	@result = Transaction.saveAndUpdateMainAccounts(@transaction)
    respond_to do |format|
      if ( @result)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully saved.' }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
		@accounts  = Account.where("name not like ?","total%").accessible_by(current_ability)
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
	    @accounts = @account = Account.where("name not like ?","total%").accessible_by(current_ability)
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end
  
  def receipt
	@transaction = Transaction.find_by_id(params[:id])
  end
end
