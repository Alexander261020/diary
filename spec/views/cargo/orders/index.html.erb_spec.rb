require 'rails_helper'

RSpec.describe "cargo/orders/index", type: :view do
  before(:each) do
    assign(:cargo_orders, [
      Cargo::Order.create!(
        status: 2
      ),
      Cargo::Order.create!(
        status: 2
      )
    ])
  end

  it "renders a list of cargo/orders" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
