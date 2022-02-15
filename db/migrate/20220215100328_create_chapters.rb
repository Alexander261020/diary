class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|

      t.timestamps
    end
  end
end
