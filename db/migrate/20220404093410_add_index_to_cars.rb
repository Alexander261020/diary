class AddIndexToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_cars, :carrier_id, :integer
    add_index :cargo_cars, :carrier_id
  end
end
