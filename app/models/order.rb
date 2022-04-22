class Order < ApplicationRecord
  belongs_to :customer

  validates :order_date, presence: true
end
