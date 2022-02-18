class AddNumberLineForBlock < ActiveRecord::Migration[7.0]
  def change
    add_column :blocks, :number_line, :integer, default: 1
  end
end
