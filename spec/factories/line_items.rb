FactoryBot.define do
  factory :line_item do
    order
    menu
    quantity { 1 }
  end
end