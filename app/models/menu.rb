class Menu < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100, minimum: 3 }, uniqueness: true
  validates :description, length: { maximum: 150 }
  validates :price, presence: true
end
