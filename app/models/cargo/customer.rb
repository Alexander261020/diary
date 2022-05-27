class Cargo::Customer < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :contacts, dependent: :destroy
  has_many :orders
  has_many :adress_loads
  has_many :adress_reloads

  has_many :customer_gruzs, dependent: :destroy
  has_many :gruzs, through: :customer_gruzs
end
