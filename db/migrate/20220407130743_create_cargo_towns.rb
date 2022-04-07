class CreateCargoTowns < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_towns do |t|
      t.string :title
      t.string :region

      t.timestamps
    end
  end
end
