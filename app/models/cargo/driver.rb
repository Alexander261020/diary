class Cargo::Driver < ApplicationRecord
  validates :name, presence: true

  belongs_to :carrier, optional: true
  has_many :contacts, dependent: :destroy
  has_many :orders
end
