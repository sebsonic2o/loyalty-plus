class RewardProgram < ActiveRecord::Base

  belongs_to :brand, inverse_of: :reward_programs
  has_many   :customer_accounts, inverse_of: :reward_program, dependent: :nullify
  has_many   :customers, through: :customer_accounts

  validates :brand, :name, presence: true
end
