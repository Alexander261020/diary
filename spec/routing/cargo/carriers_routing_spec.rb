require "rails_helper"

RSpec.describe Cargo::CarriersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cargo/carriers").to route_to("cargo/carriers#index")
    end

    it "routes to #new" do
      expect(get: "/cargo/carriers/new").to route_to("cargo/carriers#new")
    end

    it "routes to #show" do
      expect(get: "/cargo/carriers/1").to route_to("cargo/carriers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cargo/carriers/1/edit").to route_to("cargo/carriers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cargo/carriers").to route_to("cargo/carriers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cargo/carriers/1").to route_to("cargo/carriers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cargo/carriers/1").to route_to("cargo/carriers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cargo/carriers/1").to route_to("cargo/carriers#destroy", id: "1")
    end
  end
end
