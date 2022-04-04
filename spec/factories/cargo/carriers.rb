FactoryBot.define do
  factory :cargo_carrier, class: 'Cargo::Carrier' do
    name { "MyString" }
    inn { "MyString" }
    ogrn { "MyString" }
    passport { "MyString" }
    adress { "MyString" }
  end
end
