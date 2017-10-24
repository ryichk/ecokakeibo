class CreateCuisines < ActiveRecord::Migration[5.1]
  def change
    create_table :cuisines do |t|
      t.string :genre
      t.string :name
      t.integer :calorie
      t.timestamps
    end
  end
end
