class CreateFoodstuffs < ActiveRecord::Migration[5.1]
  def change
    create_table :foodstuffs do |t|
      t.string :food
      t.string :amount
      t.integer :cuisine_id, foreign_key: true

      t.timestamps
    end
  end
end
