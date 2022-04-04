require 'rails_helper'

RSpec.describe "cargo/carriers/new", type: :view do
  before(:each) do
    assign(:cargo_carrier, Cargo::Carrier.new(
      name: "MyString",
      inn: "MyString",
      ogrn: "MyString",
      passport: "MyString",
      adress: "MyString"
    ))
  end

  it "renders new cargo_carrier form" do
    render

    assert_select "form[action=?][method=?]", cargo_carriers_path, "post" do

      assert_select "input[name=?]", "cargo_carrier[name]"

      assert_select "input[name=?]", "cargo_carrier[inn]"

      assert_select "input[name=?]", "cargo_carrier[ogrn]"

      assert_select "input[name=?]", "cargo_carrier[passport]"

      assert_select "input[name=?]", "cargo_carrier[adress]"
    end
  end
end
