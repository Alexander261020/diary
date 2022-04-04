require 'rails_helper'

RSpec.describe "cargo/cars/show", type: :view do
  before(:each) do
    @cargo_car = assign(:cargo_car, Cargo::Car.create!(
      brand: "Brand",
      reg_mard: "Reg Mard",
      p_mark: "P Mark"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Reg Mard/)
    expect(rendered).to match(/P Mark/)
  end
end
