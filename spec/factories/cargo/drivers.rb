FactoryBot.define do
  factory :cargo_driver, class: 'Cargo::Driver' do
    name { "MyString" }
    passport { "MyString" }
    vy { "MyString" }
  end
end
