require "rails_helper"

RSpec.describe Cargo::CustomersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cargo/customers").to route_to("cargo/customers#index")
    end

    it "routes to #new" do
      expect(get: "/cargo/customers/new").to route_to("cargo/customers#new")
    end

    it "routes to #show" do
      expect(get: "/cargo/customers/1").to route_to("cargo/customers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cargo/customers/1/edit").to route_to("cargo/customers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cargo/customers").to route_to("cargo/customers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cargo/customers/1").to route_to("cargo/customers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cargo/customers/1").to route_to("cargo/customers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cargo/customers/1").to route_to("cargo/customers#destroy", id: "1")
    end
  end
end
