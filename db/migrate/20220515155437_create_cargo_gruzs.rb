class CreateCargoGruzs < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_gruzs do |t|
      t.string :weight
      t.string :volume
      t.string :what_is
      t.string :g_len
      t.string :g_wid
      t.string :g_hei

      t.timestamps
    end
  end
end
