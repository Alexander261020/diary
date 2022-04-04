require 'rails_helper'

RSpec.describe "cargo/contacts/edit", type: :view do
  before(:each) do
    @cargo_contact = assign(:cargo_contact, Cargo::Contact.create!(
      tel: "MyString",
      email: "MyString"
    ))
  end

  it "renders the edit cargo_contact form" do
    render

    assert_select "form[action=?][method=?]", cargo_contact_path(@cargo_contact), "post" do

      assert_select "input[name=?]", "cargo_contact[tel]"

      assert_select "input[name=?]", "cargo_contact[email]"
    end
  end
end
