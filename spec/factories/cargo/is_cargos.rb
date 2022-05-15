FactoryBot.define do
  factory :cargo_is_cargo, class: 'Cargo::IsCargo' do
    weight { "MyString" }
    volume { "MyString" }
    what_is { "MyString" }
    g_len { "MyString" }
    g_wid { "MyString" }
    g_hei { "MyString" }
  end
end
