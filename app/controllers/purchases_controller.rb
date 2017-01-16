class PurchasesController < ApplicationController
  include AuthorizeCustomer
  before_action do
    load_and_authorize(resources: 'customer_accounts')
  end

  def new
    @purchase = @customer_account.purchases.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @purchase = @customer_account.purchases.new(amount: params[:purchase][:amount])

    respond_to do |format|
      if @purchase.save
        @last_purchases = @customer_account.purchases.order(created_at: :desc).limit(10)
        format.js
      else
        format.js { render :new }
      end
    end
  end
end
