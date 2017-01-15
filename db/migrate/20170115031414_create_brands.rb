class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :account_id
      t.string :secret_key

      t.timestamps null: false
    end
  end
end
