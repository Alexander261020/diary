class Cargo::AdressLoad < ApplicationRecord
  has_many :orders
  belongs_to :customer
end
