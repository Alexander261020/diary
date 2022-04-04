require 'rails_helper'

RSpec.describe "cargo/drivers/show", type: :view do
  before(:each) do
    @cargo_driver = assign(:cargo_driver, Cargo::Driver.create!(
      name: "Name",
      passport: "Passport",
      vy: "Vy"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Passport/)
    expect(rendered).to match(/Vy/)
  end
end
