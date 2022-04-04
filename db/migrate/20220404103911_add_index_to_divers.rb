class AddIndexToDivers < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_drivers, :carrier_id, :integer
    add_index :cargo_drivers, :carrier_id
  end
end
