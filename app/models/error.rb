class Error < ApplicationRecord
  validates :name, presence: true
end
