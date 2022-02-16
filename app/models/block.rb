class Block < ApplicationRecord
  belongs_to :chapter, optional: true
end
