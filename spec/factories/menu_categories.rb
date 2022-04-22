FactoryBot.define do
  factory :menu_category do
    menu { build(:menu) }
    category { build(:category) }
  end
end
