require 'rails_helper'

RSpec.describe "cargo/contacts/show", type: :view do
  before(:each) do
    @cargo_contact = assign(:cargo_contact, Cargo::Contact.create!(
      tel: "Tel",
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tel/)
    expect(rendered).to match(/Email/)
  end
end
