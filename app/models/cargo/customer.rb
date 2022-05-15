class Cargo::Customer < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :contacts, dependent: :destroy
  has_many :orders
  has_many :adress_loads
end
