require 'rails_helper'

RSpec.describe "cargo/carriers/show", type: :view do
  before(:each) do
    @cargo_carrier = assign(:cargo_carrier, Cargo::Carrier.create!(
      name: "Name",
      inn: "Inn",
      ogrn: "Ogrn",
      passport: "Passport",
      adress: "Adress"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Inn/)
    expect(rendered).to match(/Ogrn/)
    expect(rendered).to match(/Passport/)
    expect(rendered).to match(/Adress/)
  end
end
