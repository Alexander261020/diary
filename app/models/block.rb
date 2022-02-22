class Block < ApplicationRecord
  belongs_to :chapter, optional: true
  belongs_to :subsection, optional: true
end
