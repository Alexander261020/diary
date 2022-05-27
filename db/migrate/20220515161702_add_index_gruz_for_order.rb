class AddIndexGruzForOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_orders, :gruz_id, :integer
    add_index :cargo_orders, :gruz_id
  end
end
