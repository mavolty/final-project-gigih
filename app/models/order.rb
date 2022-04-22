class Order < ApplicationRecord
  NEW = 'new'.freeze
  PAID = 'paid'.freeze
  CANCELLED = 'cancelled'.freeze

  has_many :line_items, dependent: :destroy
  belongs_to :customer

  validates :order_date, presence: true
  validates :customer_id, presence: true
  validates :status, presence: true, inclusion: { in: [NEW, PAID, CANCELLED] }
end
