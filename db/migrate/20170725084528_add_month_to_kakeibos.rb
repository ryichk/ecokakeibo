class AddMonthToKakeibos < ActiveRecord::Migration[5.1]
  def change
    add_column :kakeibos, :month, :string
  end
end
