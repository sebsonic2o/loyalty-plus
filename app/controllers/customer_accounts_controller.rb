class CustomerAccountsController < ApplicationController

  def index
    @accounts = current_customer.customer_accounts.page(params[:page]).includes(:brand)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
