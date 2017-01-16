class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :amount, null: false, default: 0

      t.references :customer_account, index: true

      t.timestamps null: false
    end
  end
end
