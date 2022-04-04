require 'rails_helper'

RSpec.describe "cargo/carriers/index", type: :view do
  before(:each) do
    assign(:cargo_carriers, [
      Cargo::Carrier.create!(
        name: "Name",
        inn: "Inn",
        ogrn: "Ogrn",
        passport: "Passport",
        adress: "Adress"
      ),
      Cargo::Carrier.create!(
        name: "Name",
        inn: "Inn",
        ogrn: "Ogrn",
        passport: "Passport",
        adress: "Adress"
      )
    ])
  end

  it "renders a list of cargo/carriers" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Inn".to_s, count: 2
    assert_select "tr>td", text: "Ogrn".to_s, count: 2
    assert_select "tr>td", text: "Passport".to_s, count: 2
    assert_select "tr>td", text: "Adress".to_s, count: 2
  end
end
