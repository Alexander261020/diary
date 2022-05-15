class AddIndexForAdressRelad < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_adress_reloads, :order_id, :integer
    add_column :cargo_adress_reloads, :customer_id, :integer
    add_index :cargo_adress_reloads, :customer_id
  end
end
