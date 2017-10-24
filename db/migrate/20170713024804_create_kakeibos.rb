class CreateKakeibos < ActiveRecord::Migration[5.1]
  def change
    create_table :kakeibos do |t|
      t.float :denki
      t.integer :denki_cost
      t.float :gas
      t.integer :gas_cost
      t.float :suidou
      t.integer :suidou_cost

      t.timestamps null: false
    end
  end
end
