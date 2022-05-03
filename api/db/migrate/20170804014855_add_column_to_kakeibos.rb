class AddColumnToKakeibos < ActiveRecord::Migration[5.1]
  def change
    add_column :kakeibos, :denki_env, :float
    add_column :kakeibos, :gas_env, :float
    add_column :kakeibos, :suidou_env, :float
    add_column :kakeibos, :env_load, :float
  end
end
