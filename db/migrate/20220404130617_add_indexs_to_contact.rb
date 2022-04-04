class AddIndexsToContact < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_contacts, :carrier_id, :integer
    add_index :cargo_contacts, :carrier_id
    add_column :cargo_contacts, :customer_id, :integer
    add_index :cargo_contacts, :customer_id
    add_column :cargo_contacts, :driver_id, :integer
    add_index :cargo_contacts, :driver_id
  end
end
