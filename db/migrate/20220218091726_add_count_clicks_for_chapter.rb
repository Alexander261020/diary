class AddCountClicksForChapter < ActiveRecord::Migration[7.0]
  def change
    add_column :chapters, :count_clicks, :integer, default: 0
  end
end
