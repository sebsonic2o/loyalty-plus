class AddTotalPurchasesToCustomerAccounts < ActiveRecord::Migration
  def change
    add_column :customer_accounts, :total_purchases, :integer, default: 0, null: false
  end
end
