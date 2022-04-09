class AddTownFromAndTownInForOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_orders, :town_from_id, :integer
    add_index :cargo_orders, :town_from_id
    add_column :cargo_orders, :town_in_id, :integer
    add_index :cargo_orders, :town_in_id
  end
end
