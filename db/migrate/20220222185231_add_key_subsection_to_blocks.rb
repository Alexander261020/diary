class AddKeySubsectionToBlocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :blocks, :subsection, foreign_key: true
  end
end
