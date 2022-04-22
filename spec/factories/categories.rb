FactoryBot.define do
  factory :category do
    name { Faker::Name.unique.name[2..49] }
  end
end
