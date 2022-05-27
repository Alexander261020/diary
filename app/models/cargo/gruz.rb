class Cargo::Gruz < ApplicationRecord
  has_many :orders

  has_many :customer_gruzs, dependent: :destroy
  has_many :customer, through: :customer_gruzs
end
