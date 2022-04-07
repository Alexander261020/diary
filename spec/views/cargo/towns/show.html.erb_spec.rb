require 'rails_helper'

RSpec.describe "cargo/towns/show", type: :view do
  before(:each) do
    @cargo_town = assign(:cargo_town, Cargo::Town.create!(
      name: "Name",
      region: "Region"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Region/)
  end
end
