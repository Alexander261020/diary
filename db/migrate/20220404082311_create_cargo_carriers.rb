class CreateCargoCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_carriers do |t|
      t.string :name
      t.string :inn
      t.string :ogrn
      t.string :passport
      t.string :adress

      t.timestamps
    end
  end
end
