class AddIndexAdressReloadForOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_orders, :adress_reload_id, :integer
    add_index :cargo_orders, :adress_reload_id
  end
end
