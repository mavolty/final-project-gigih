FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish[2..99] }
    description { Faker::Food.description[2..149] }
    price { 10_000.0 }
    association :category
  end
end
