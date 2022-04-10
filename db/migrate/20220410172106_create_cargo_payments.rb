class CreateCargoPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_payments do |t|
      t.integer :sum, default: 0
      t.integer :sin, default: 0

      t.timestamps
    end
  end
end
