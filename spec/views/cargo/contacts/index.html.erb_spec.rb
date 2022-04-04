require 'rails_helper'

RSpec.describe "cargo/contacts/index", type: :view do
  before(:each) do
    assign(:cargo_contacts, [
      Cargo::Contact.create!(
        tel: "Tel",
        email: "Email"
      ),
      Cargo::Contact.create!(
        tel: "Tel",
        email: "Email"
      )
    ])
  end

  it "renders a list of cargo/contacts" do
    render
    assert_select "tr>td", text: "Tel".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
