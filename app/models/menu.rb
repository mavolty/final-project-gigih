class Menu < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100, minimum: 3 }
end
