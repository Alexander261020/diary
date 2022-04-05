require 'rails_helper'

RSpec.describe "cargo/orders/new", type: :view do
  before(:each) do
    assign(:cargo_order, Cargo::Order.new(
      status: 1
    ))
  end

  it "renders new cargo_order form" do
    render

    assert_select "form[action=?][method=?]", cargo_orders_path, "post" do

      assert_select "input[name=?]", "cargo_order[status]"
    end
  end
end
