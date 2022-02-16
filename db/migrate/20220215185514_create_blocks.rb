class CreateBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :blocks do |t|
      t.belongs_to :chapter, foreign_key: true
      t.string :content
      t.string :comment
      t.string :link
      t.timestamps
    end
  end
end
