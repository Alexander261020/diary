class Cargo::Carrier < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
