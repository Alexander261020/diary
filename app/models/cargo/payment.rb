class Cargo::Payment < ApplicationRecord
  belongs_to :order
end
