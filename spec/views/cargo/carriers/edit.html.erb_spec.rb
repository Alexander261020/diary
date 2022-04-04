require 'rails_helper'

RSpec.describe "cargo/carriers/edit", type: :view do
  before(:each) do
    @cargo_carrier = assign(:cargo_carrier, Cargo::Carrier.create!(
      name: "MyString",
      inn: "MyString",
      ogrn: "MyString",
      passport: "MyString",
      adress: "MyString"
    ))
  end

  it "renders the edit cargo_carrier form" do
    render

    assert_select "form[action=?][method=?]", cargo_carrier_path(@cargo_carrier), "post" do

      assert_select "input[name=?]", "cargo_carrier[name]"

      assert_select "input[name=?]", "cargo_carrier[inn]"

      assert_select "input[name=?]", "cargo_carrier[ogrn]"

      assert_select "input[name=?]", "cargo_carrier[passport]"

      assert_select "input[name=?]", "cargo_carrier[adress]"
    end
  end
end
