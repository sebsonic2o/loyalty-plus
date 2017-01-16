class CustomerAccount < ActiveRecord::Base

  paginates_per 10

  belongs_to :customer, inverse_of: :customer_accounts
  belongs_to :brand, inverse_of: :customer_accounts
  belongs_to :reward_program, inverse_of: :customer_accounts

  validates               :customer, :brand, presence: true
  validates_uniqueness_of :customer, scope: :brand
end
