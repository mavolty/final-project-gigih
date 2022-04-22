FactoryBot.define do
  factory :menu do
    name { Faker::Name.unique.name[2..99] }
    description { Faker::Food.description[2..149] }
    price { 10_000.0 }
  end
end

def menu_with_categories(categories_count: 5)
  FactoryBot.create(:menu) do |menu|
    FactoryBot.create_list(:category, categories_count, menu: menu)
  end
end
