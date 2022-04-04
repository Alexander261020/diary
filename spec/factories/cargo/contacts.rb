FactoryBot.define do
  factory :cargo_contact, class: 'Cargo::Contact' do
    tel { "MyString" }
    email { "MyString" }
  end
end
