require 'rails_helper'

RSpec.describe "cargo/towns/new", type: :view do
  before(:each) do
    assign(:cargo_town, Cargo::Town.new(
      name: "MyString",
      region: "MyString"
    ))
  end

  it "renders new cargo_town form" do
    render

    assert_select "form[action=?][method=?]", cargo_towns_path, "post" do

      assert_select "input[name=?]", "cargo_town[name]"

      assert_select "input[name=?]", "cargo_town[region]"
    end
  end
end
