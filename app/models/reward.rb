class Reward < ActiveRecord::Base

  belongs_to :customer_account, inverse_of: :rewards

  validates :customer_account, presence: true
end
