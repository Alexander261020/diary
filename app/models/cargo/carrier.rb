class Cargo::Carrier < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :cars, dependent: :destroy
  has_many :drivers, dependent: :destroy
  has_many :contacts
end
