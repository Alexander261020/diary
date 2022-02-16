class Chapter < ApplicationRecord
  has_many :blocks, dependent: :destroy

  validates :name, presence: true, length: { maximum:255 }
end
