FactoryBot.define do
  factory :order do
    order_date { Date.today }
    status { 'new' }
    quantity { 1 }
    customer { build(:customer) }
  end
end
