class Subsection < ApplicationRecord
  belongs_to :chapter, optional: true
  has_many :blocks, dependent: :destroy
end
