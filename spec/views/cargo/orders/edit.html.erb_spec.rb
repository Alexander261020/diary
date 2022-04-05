require 'rails_helper'

RSpec.describe "cargo/orders/edit", type: :view do
  before(:each) do
    @cargo_order = assign(:cargo_order, Cargo::Order.create!(
      status: 1
    ))
  end

  it "renders the edit cargo_order form" do
    render

    assert_select "form[action=?][method=?]", cargo_order_path(@cargo_order), "post" do

      assert_select "input[name=?]", "cargo_order[status]"
    end
  end
end
