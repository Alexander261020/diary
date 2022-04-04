require 'rails_helper'

RSpec.describe "cargo/customers/edit", type: :view do
  before(:each) do
    @cargo_customer = assign(:cargo_customer, Cargo::Customer.create!(
      name: "MyString",
      inn: "MyString",
      ogrn: "MyString",
      passport: "MyString",
      adress: "MyString"
    ))
  end

  it "renders the edit cargo_customer form" do
    render

    assert_select "form[action=?][method=?]", cargo_customer_path(@cargo_customer), "post" do

      assert_select "input[name=?]", "cargo_customer[name]"

      assert_select "input[name=?]", "cargo_customer[inn]"

      assert_select "input[name=?]", "cargo_customer[ogrn]"

      assert_select "input[name=?]", "cargo_customer[passport]"

      assert_select "input[name=?]", "cargo_customer[adress]"
    end
  end
end
