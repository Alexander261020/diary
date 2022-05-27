class Cargo::CustomerGruz < ApplicationRecord
  belongs_to :customer
  belongs_to :gruz
end
