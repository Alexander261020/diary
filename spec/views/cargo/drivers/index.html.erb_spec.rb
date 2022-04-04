require 'rails_helper'

RSpec.describe "cargo/drivers/index", type: :view do
  before(:each) do
    assign(:cargo_drivers, [
      Cargo::Driver.create!(
        name: "Name",
        passport: "Passport",
        vy: "Vy"
      ),
      Cargo::Driver.create!(
        name: "Name",
        passport: "Passport",
        vy: "Vy"
      )
    ])
  end

  it "renders a list of cargo/drivers" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Passport".to_s, count: 2
    assert_select "tr>td", text: "Vy".to_s, count: 2
  end
end
