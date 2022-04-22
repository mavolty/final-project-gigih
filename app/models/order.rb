class Order < ApplicationRecord
  belongs_to :customer

  validates :order_date, presence: true
  validates :customer_id, presence: true
end
