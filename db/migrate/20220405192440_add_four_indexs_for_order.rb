class AddFourIndexsForOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_orders, :carrier_id, :integer
    add_index :cargo_orders, :carrier_id
    add_column :cargo_orders, :customer_id, :integer
    add_index :cargo_orders, :customer_id
    add_column :cargo_orders, :car_id, :integer
    add_index :cargo_orders, :car_id
    add_column :cargo_orders, :driver_id, :integer
    add_index :cargo_orders, :driver_id
  end
end
