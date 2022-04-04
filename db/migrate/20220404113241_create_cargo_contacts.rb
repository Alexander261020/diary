class CreateCargoContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_contacts do |t|
      t.string :tel
      t.string :email

      t.timestamps
    end
  end
end
