require 'rails_helper'

RSpec.describe "cargo/drivers/edit", type: :view do
  before(:each) do
    @cargo_driver = assign(:cargo_driver, Cargo::Driver.create!(
      name: "MyString",
      passport: "MyString",
      vy: "MyString"
    ))
  end

  it "renders the edit cargo_driver form" do
    render

    assert_select "form[action=?][method=?]", cargo_driver_path(@cargo_driver), "post" do

      assert_select "input[name=?]", "cargo_driver[name]"

      assert_select "input[name=?]", "cargo_driver[passport]"

      assert_select "input[name=?]", "cargo_driver[vy]"
    end
  end
end
