require 'rails_helper'

RSpec.describe "cargo/towns/edit", type: :view do
  before(:each) do
    @cargo_town = assign(:cargo_town, Cargo::Town.create!(
      name: "MyString",
      region: "MyString"
    ))
  end

  it "renders the edit cargo_town form" do
    render

    assert_select "form[action=?][method=?]", cargo_town_path(@cargo_town), "post" do

      assert_select "input[name=?]", "cargo_town[name]"

      assert_select "input[name=?]", "cargo_town[region]"
    end
  end
end
