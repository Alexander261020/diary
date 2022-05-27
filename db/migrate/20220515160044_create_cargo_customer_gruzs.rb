class CreateCargoCustomerGruzs < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_customer_gruzs do |t|
      t.belongs_to :customer
      t.belongs_to :gruz
    end
  end
end
