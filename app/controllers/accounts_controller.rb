class AccountsController < ApplicationController

  include Databasedotcom::Rails::Controller

  # GET /accounts
  def index
    @accounts = Account__c.all
  end

  # GET /accounts/1
  def show
    @account = Account__c.find(params[:id])
  end

  # GET /accounts/new
  def new
    @account = Account__c.new
  end

  # GET /accounts/1/edit
  def edit
    @account = Account__c.find(params[:id])
  end

  # POST /accounts
  def create
    @account = Account__c.new(params[:account])
    # fetch the id of any user as the 'owner' - required by sfdc
    @account.OwnerId = User.first.Id

    if @account.save
      redirect_to account_path(@account), notice: 'Account was successfully created.'
    else
      format.html { render action: "new" }
    end
  end

  # this action throws following error: https://gist.github.com/1428406
  # PUT /accounts/1
  def update
    @account = Account__c.find(params[:id])

    begin
      @account.update_attributes Account__c.coerce_params(params[:account])
      notice = 'Account updated successfully'
    rescue Databasedotcom::SalesForceError => e
      notice = 'Could not update record!!'
    end

    redirect_to account_path(@account), notice: notice
  end

  # DELETE /accounts/1
  def destroy
    @account = Account__c.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end
end
