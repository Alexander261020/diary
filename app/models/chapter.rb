class Chapter < ApplicationRecord
  has_many :blocks, dependent: :destroy
  has_many :subsections, dependent: :destroy

  validates :name, presence: true, length: { maximum:255 }
  validates :name, uniqueness: true
end
