class Cargo::Contact < ApplicationRecord
  belongs_to :carrier, optional: true
  belongs_to :customer, optional: true
  belongs_to :driver, optional: true
end
