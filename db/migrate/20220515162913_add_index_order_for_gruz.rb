class AddIndexOrderForGruz < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_gruzs, :order_id, :integer
  end
end
