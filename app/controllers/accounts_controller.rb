class AccountsController < ApplicationController

  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all.order(age: :asc)
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    
    if @account.save
      flash[:success] = "Account #{@account.name} created!!!"
      redirect_to accounts_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    if @account.update(account_params)
      flash[:success] = "Account #{@account.name} updated!!!"
      redirect_to accounts_path
    else
      render 'new'
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    flash[:success] = "Account #{@account.name} deleted!"
    redirect_to accounts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :age)
    end
end
