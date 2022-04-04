class CreateCargoCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_cars do |t|
      t.string :brand
      t.string :reg_mark
      t.string :p_mark

      t.timestamps
    end
  end
end
