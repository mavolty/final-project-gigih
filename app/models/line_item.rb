class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu

  validates :menu_id, presence: true
end
