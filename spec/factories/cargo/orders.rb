FactoryBot.define do
  factory :cargo_order, class: 'Cargo::Order' do
    status { 1 }
  end
end
