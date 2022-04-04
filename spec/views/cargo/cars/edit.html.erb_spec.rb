require 'rails_helper'

RSpec.describe "cargo/cars/edit", type: :view do
  before(:each) do
    @cargo_car = assign(:cargo_car, Cargo::Car.create!(
      brand: "MyString",
      reg_mard: "MyString",
      p_mark: "MyString"
    ))
  end

  it "renders the edit cargo_car form" do
    render

    assert_select "form[action=?][method=?]", cargo_car_path(@cargo_car), "post" do

      assert_select "input[name=?]", "cargo_car[brand]"

      assert_select "input[name=?]", "cargo_car[reg_mard]"

      assert_select "input[name=?]", "cargo_car[p_mark]"
    end
  end
end
