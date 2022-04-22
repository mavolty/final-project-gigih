class Order < ApplicationRecord
  NEW = 'new'.freeze
  PAID = 'paid'.freeze
  CANCELLED = 'cancelled'.freeze

  has_many :line_items, dependent: :destroy
  has_many :menus, through: :line_items
  belongs_to :customer

  validates :order_date, presence: true
  validates :customer_id, presence: true
  validates :status, presence: true, inclusion: { in: [NEW, PAID, CANCELLED] }

  after_initialize :set_defaults

  private

  def set_defaults
    return unless new_record?

    self.order_date ||= Date.today
    self.status ||= NEW
  end
end
