class Cargo::Order < ApplicationRecord
  COLOR = ['', 'primary', 'success', 'dark', 'secondary', 'danger']

  belongs_to :customer, optional: true
  belongs_to :carrier, optional: true
  belongs_to :car, optional: true
  belongs_to :driver, optional: true
  has_one :payment
  has_one :adress_load

  belongs_to :town_from, class_name: "Town", foreign_key: "town_from_id", optional: true
  belongs_to :town_in, class_name: "Town", foreign_key: "town_in_id", optional: true
end
