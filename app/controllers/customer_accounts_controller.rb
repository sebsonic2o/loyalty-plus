class CustomerAccountsController < ApplicationController
  include AuthorizeCustomer
  before_action :load_and_authorize, except: :index

  def index
    @accounts = current_customer.customer_accounts.page(params[:page]).includes(:brand)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end
end
