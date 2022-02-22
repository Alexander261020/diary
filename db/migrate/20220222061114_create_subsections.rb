class CreateSubsections < ActiveRecord::Migration[7.0]
  def change
    create_table :subsections do |t|
      t.belongs_to :chapter, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
