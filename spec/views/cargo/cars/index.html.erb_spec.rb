require 'rails_helper'

RSpec.describe "cargo/cars/index", type: :view do
  before(:each) do
    assign(:cargo_cars, [
      Cargo::Car.create!(
        brand: "Brand",
        reg_mard: "Reg Mard",
        p_mark: "P Mark"
      ),
      Cargo::Car.create!(
        brand: "Brand",
        reg_mard: "Reg Mard",
        p_mark: "P Mark"
      )
    ])
  end

  it "renders a list of cargo/cars" do
    render
    assert_select "tr>td", text: "Brand".to_s, count: 2
    assert_select "tr>td", text: "Reg Mard".to_s, count: 2
    assert_select "tr>td", text: "P Mark".to_s, count: 2
  end
end
