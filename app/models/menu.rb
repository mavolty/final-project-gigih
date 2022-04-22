class Menu < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100, minimum: 3 }, uniqueness: true
  validates :description, length: { maximum: 150 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
end
