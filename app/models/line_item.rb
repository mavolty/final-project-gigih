class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu

  validates :menu_id, presence: true
  validates :order_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true }

  def total_price
    menu.price * quantity
  end
end
