FactoryBot.define do
  factory :chapter do
    # генерируем разделы с разными именами
    sequence(:name) { |n| "Number-#{n}" }
  end
end
