class RewardsController < ApplicationController
  include AuthorizeCustomer
  before_action do
    load_and_authorize(resources: 'customer_accounts')
  end

  def new
    @reward = @customer_account.rewards.new(points: nil)

    respond_to do |format|
      format.js
    end
  end

  def create
    @reward = @customer_account.rewards.new(points: params[:reward][:points])

    respond_to do |format|
      if @reward.save
        @last_rewards   = @customer_account.rewards.order(created_at: :desc).limit(5)
        format.js
      else
        format.js { render :new }
      end
    end
  end
end
