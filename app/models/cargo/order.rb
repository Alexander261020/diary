class Cargo::Order < ApplicationRecord
  COLOR = ['', 'primary', 'success', 'dark', 'secondary', 'danger']

  belongs_to :customer, optional: true
  belongs_to :carrier, optional: true
  belongs_to :car, optional: true
  belongs_to :driver, optional: true
end
