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
    respond_to do |format|
      format.html
    end
  end

  def new_enrolment
    respond_to do |format|
      format.js
    end
  end

  def enroll
    @customer_account.reward_program = @customer_account.brand.reward_programs.find_by(id: params[:customer_account][:reward_program_id])

    respond_to do |format|
      if @customer_account.save
        format.js
      else
        format.js { render :new_enrolment }
      end
    end
  end
end
