require 'rails_helper'

RSpec.describe "cargo/cars/new", type: :view do
  before(:each) do
    assign(:cargo_car, Cargo::Car.new(
      brand: "MyString",
      reg_mard: "MyString",
      p_mark: "MyString"
    ))
  end

  it "renders new cargo_car form" do
    render

    assert_select "form[action=?][method=?]", cargo_cars_path, "post" do

      assert_select "input[name=?]", "cargo_car[brand]"

      assert_select "input[name=?]", "cargo_car[reg_mard]"

      assert_select "input[name=?]", "cargo_car[p_mark]"
    end
  end
end
