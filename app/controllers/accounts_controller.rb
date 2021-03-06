class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    @accounts = Account.where("name not like ?","total%").accessible_by(current_ability)
	#@account = Account.accessible_by(current_ability)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    params[:user_id] = current_user.id
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new
	@accountTypes = AccountType.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
	@accountTypes = AccountType.find(:all)
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])
	@account.user = User.find_by_id(current_user.id)#current_user.id
	@error = Account.addAndUpdateTotals(@account) 	
    respond_to do |format|
      if(@error=="" && @account.errors.empty?) #@account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
		@accountTypes = AccountType.find(:all)
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
		@accountTypes = AccountType.find(:all)
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end
end
