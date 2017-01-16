class CreateCustomerAccounts < ActiveRecord::Migration
  def change
    create_table :customer_accounts do |t|
      t.integer :points_balance, null: false, default: 0

      t.references :customer, index: true
      t.references :brand, index: true
      t.references :reward_program, index: true

      t.timestamps null: false
    end
  end
end
