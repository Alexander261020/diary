class Cargo::Driver < ApplicationRecord
  validates :name, presence: true

  belongs_to :carrier, optional: true
end
