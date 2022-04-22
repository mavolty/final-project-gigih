FactoryBot.define do
  factory :category do
    name { Faker::Food.ethnic_category[2..49] }
    association :menu
  end
end
