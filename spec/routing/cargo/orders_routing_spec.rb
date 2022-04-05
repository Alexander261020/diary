require "rails_helper"

RSpec.describe Cargo::OrdersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cargo/orders").to route_to("cargo/orders#index")
    end

    it "routes to #new" do
      expect(get: "/cargo/orders/new").to route_to("cargo/orders#new")
    end

    it "routes to #show" do
      expect(get: "/cargo/orders/1").to route_to("cargo/orders#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cargo/orders/1/edit").to route_to("cargo/orders#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cargo/orders").to route_to("cargo/orders#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cargo/orders/1").to route_to("cargo/orders#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cargo/orders/1").to route_to("cargo/orders#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cargo/orders/1").to route_to("cargo/orders#destroy", id: "1")
    end
  end
end
