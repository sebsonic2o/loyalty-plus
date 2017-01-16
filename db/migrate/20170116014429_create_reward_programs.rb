class CreateRewardPrograms < ActiveRecord::Migration
  def change
    create_table :reward_programs do |t|
      t.string  :name, null: false, default: ""
      t.integer :points_dollar, null: false, default: 0

      t.references :brand, index: true

      t.timestamps null: false
    end
  end
end
