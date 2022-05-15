class AddDateLoadAndDateReload < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_orders, :date_load, :string
    add_column :cargo_orders, :date_reload, :string
  end
end
