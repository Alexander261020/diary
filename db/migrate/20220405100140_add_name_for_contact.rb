class AddNameForContact < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_contacts, :name_contact, :string, default: nil
  end
end
