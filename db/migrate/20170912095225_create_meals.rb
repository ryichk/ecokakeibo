class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.integer :cuisine_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.float :foodmileage
      t.float :virtualwater

      t.timestamps
    end
  end
end
