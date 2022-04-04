FactoryBot.define do
  factory :cargo_customer, class: 'Cargo::Customer' do
    name { "MyString" }
    inn { "MyString" }
    ogrn { "MyString" }
    passport { "MyString" }
    adress { "MyString" }
  end
end
