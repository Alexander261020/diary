class Cargo::Car < ApplicationRecord
  validates :reg_mark, presence: true, uniqueness: true

  belongs_to :carrier, optional: true
  has_many :orders
end
