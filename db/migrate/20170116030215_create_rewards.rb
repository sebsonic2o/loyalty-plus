class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :points, null: false, default: 0

      t.references :customer_account, index: true

      t.timestamps null: false
    end
  end
end
