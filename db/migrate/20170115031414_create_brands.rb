class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, null: false, default: ""
      t.string :account_id, null: false, default: ""
      t.string :secret_key, null: false, default: ""

      t.timestamps null: false
    end
  end
end
