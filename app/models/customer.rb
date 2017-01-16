class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :customer_accounts, inverse_of: :customer, dependent: :destroy
  has_many :brands, through: :customer_accounts
  has_many :rewards, through: :customer_accounts
  has_many :purchases, through: :customer_accounts
  has_many :reward_programs, through: :customer_accounts
end
