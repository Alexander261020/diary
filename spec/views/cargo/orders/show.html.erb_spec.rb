require 'rails_helper'

RSpec.describe "cargo/orders/show", type: :view do
  before(:each) do
    @cargo_order = assign(:cargo_order, Cargo::Order.create!(
      status: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
