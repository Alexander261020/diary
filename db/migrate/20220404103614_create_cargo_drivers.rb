class CreateCargoDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_drivers do |t|
      t.string :name
      t.string :passport
      t.string :vy

      t.timestamps
    end
  end
end
