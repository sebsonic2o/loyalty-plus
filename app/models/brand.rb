class Brand < ActiveRecord::Base

  has_many :customer_accounts, inverse_of: :brand, dependent: :destroy
  has_many :customers, through: :customer_accounts
  has_many :reward_programs, inverse_of: :brand, dependent: :destroy

  validates               :name, :account_id, :secret_key, presence: true
  validates_uniqueness_of :account_id
end
