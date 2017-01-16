class Purchase < ActiveRecord::Base

  belongs_to :customer_account, inverse_of: :rewards

  after_save :process_purchase, if: :amount_changed?

  validates :amount, :customer_account, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true

private

  def process_purchase
    value = amount - amount_was
    customer_account.total_purchases += value
    if program = customer_account.reward_program
      customer_account.points_balance += program.points_dollar * value
    end
    customer_account.save
  end
end
