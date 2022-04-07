require 'rails_helper'

RSpec.describe "cargo/towns/index", type: :view do
  before(:each) do
    assign(:cargo_towns, [
      Cargo::Town.create!(
        name: "Name",
        region: "Region"
      ),
      Cargo::Town.create!(
        name: "Name",
        region: "Region"
      )
    ])
  end

  it "renders a list of cargo/towns" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Region".to_s, count: 2
  end
end
