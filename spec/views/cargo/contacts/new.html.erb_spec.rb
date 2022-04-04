require 'rails_helper'

RSpec.describe "cargo/contacts/new", type: :view do
  before(:each) do
    assign(:cargo_contact, Cargo::Contact.new(
      tel: "MyString",
      email: "MyString"
    ))
  end

  it "renders new cargo_contact form" do
    render

    assert_select "form[action=?][method=?]", cargo_contacts_path, "post" do

      assert_select "input[name=?]", "cargo_contact[tel]"

      assert_select "input[name=?]", "cargo_contact[email]"
    end
  end
end
