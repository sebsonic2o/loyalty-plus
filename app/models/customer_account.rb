class CustomerAccount < ActiveRecord::Base

  paginates_per 10

  belongs_to :customer, inverse_of: :customer_accounts
  belongs_to :brand, inverse_of: :customer_accounts
  belongs_to :reward_program, inverse_of: :customer_accounts
  has_many   :rewards, inverse_of: :customer_account, dependent: :destroy
  has_many   :purchases, inverse_of: :customer_account, dependent: :destroy

  validates               :customer, :brand, presence: true
  validates_uniqueness_of :customer, scope: :brand
end
