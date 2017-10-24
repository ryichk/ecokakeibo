class AddUserIdToKakeibos < ActiveRecord::Migration[5.1]
  def change
    add_column :kakeibos, :user_id, :integer
  end
end
