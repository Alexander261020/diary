class Cargo::Customer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
