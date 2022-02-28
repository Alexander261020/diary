class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.integer :status, limit: 3, default: 0

      t.timestamps
    end
  end
end
