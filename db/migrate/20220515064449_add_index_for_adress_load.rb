class AddIndexForAdressLoad < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_adress_loads, :order_id, :integer
    add_column :cargo_adress_loads, :customer_id, :integer
    add_index :cargo_adress_loads, :customer_id
  end
end
