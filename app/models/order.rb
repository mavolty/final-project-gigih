class Order < ApplicationRecord
  NEW = 'new'.freeze
  PAID = 'paid'.freeze
  CANCELLED = 'cancelled'.freeze

  belongs_to :customer

  validates :order_date, presence: true
  validates :customer_id, presence: true
  validates :status, presence: true, inclusion: { in: [NEW, PAID, CANCELLED] }
end
