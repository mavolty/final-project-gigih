class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50, minimum: 3 }, uniqueness: true
end
