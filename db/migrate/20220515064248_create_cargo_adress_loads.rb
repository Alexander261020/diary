class CreateCargoAdressLoads < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_adress_loads do |t|
      t.string :adress
      t.timestamps
    end
  end
end
