class Category < ApplicationRecord
  has_many :menu_categories
  has_many :menus, through: :menu_categories

  validates :name, presence: true, length: { maximum: 50, minimum: 3 }, uniqueness: true
end
