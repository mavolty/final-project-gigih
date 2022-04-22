FactoryBot.define do
  factory :order do
    order_date { Date.today }
    status { 'new' }
    customer { create(:customer) }
    customer_id { customer.id }
  end
end
