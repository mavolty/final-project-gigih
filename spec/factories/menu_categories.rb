FactoryBot.define do
  factory :menu_category do
    association :menu
    association :category
  end
end
