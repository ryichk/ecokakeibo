class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :setai, :integer
  end
end
