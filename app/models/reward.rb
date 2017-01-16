class Reward < ActiveRecord::Base

  belongs_to :customer_account, inverse_of: :rewards

  after_save :process_reward, if: :points_changed?

  validates :points, :customer_account, presence: true
  validates :points, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validate  :check_balance, if: :points_changed?

private

  def check_balance
    value = points - points_was

    if customer_account.points_balance < 100
      errors.add(:points, "can't redeem when balance is less than 100")
    elsif customer_account.points_balance < value
      errors.add(:points, "can't be greater than balance")
    end
  end

  def process_reward
    value = points - points_was
    customer_account.points_balance -= value
    customer_account.save
  end
end
