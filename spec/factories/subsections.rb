FactoryBot.define do
  factory :subsection do
    # добавляю связь с разделом
    association :chapter
    sequence(:name) { |n| "Sub-#{n}" }
  end
end
