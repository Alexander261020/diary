class AddFieldFolderToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :cargo_orders, :folder, :string, default: nil
  end
end
