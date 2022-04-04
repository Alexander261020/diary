require 'rails_helper'

RSpec.describe "cargo/drivers/new", type: :view do
  before(:each) do
    assign(:cargo_driver, Cargo::Driver.new(
      name: "MyString",
      passport: "MyString",
      vy: "MyString"
    ))
  end

  it "renders new cargo_driver form" do
    render

    assert_select "form[action=?][method=?]", cargo_drivers_path, "post" do

      assert_select "input[name=?]", "cargo_driver[name]"

      assert_select "input[name=?]", "cargo_driver[passport]"

      assert_select "input[name=?]", "cargo_driver[vy]"
    end
  end
end
