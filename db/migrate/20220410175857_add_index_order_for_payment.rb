class AddIndexOrderForPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_payments, :order_id, :integer
    add_index :cargo_payments, :order_id
  end
end
