class Subsection < ApplicationRecord
  belongs_to :chapter, optional: true
  has_many :blocks, dependent: :destroy

  validates :name, presence: true, length: { maximum:255 }
end
