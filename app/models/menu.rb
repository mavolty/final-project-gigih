class Menu < ApplicationRecord
  has_many :menu_categories, dependent: :destroy
  has_many :categories, through: :menu_categories
  has_many :line_items, dependent: :destroy
  has_many :orders, through: :line_items

  validates :name, presence: true, length: { maximum: 100, minimum: 3 }, uniqueness: true
  validates :description, length: { maximum: 150 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
end
