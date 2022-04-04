require 'rails_helper'

RSpec.describe "cargo/customers/new", type: :view do
  before(:each) do
    assign(:cargo_customer, Cargo::Customer.new(
      name: "MyString",
      inn: "MyString",
      ogrn: "MyString",
      passport: "MyString",
      adress: "MyString"
    ))
  end

  it "renders new cargo_customer form" do
    render

    assert_select "form[action=?][method=?]", cargo_customers_path, "post" do

      assert_select "input[name=?]", "cargo_customer[name]"

      assert_select "input[name=?]", "cargo_customer[inn]"

      assert_select "input[name=?]", "cargo_customer[ogrn]"

      assert_select "input[name=?]", "cargo_customer[passport]"

      assert_select "input[name=?]", "cargo_customer[adress]"
    end
  end
end
