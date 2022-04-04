require "rails_helper"

RSpec.describe Cargo::DriversController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cargo/drivers").to route_to("cargo/drivers#index")
    end

    it "routes to #new" do
      expect(get: "/cargo/drivers/new").to route_to("cargo/drivers#new")
    end

    it "routes to #show" do
      expect(get: "/cargo/drivers/1").to route_to("cargo/drivers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cargo/drivers/1/edit").to route_to("cargo/drivers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cargo/drivers").to route_to("cargo/drivers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cargo/drivers/1").to route_to("cargo/drivers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cargo/drivers/1").to route_to("cargo/drivers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cargo/drivers/1").to route_to("cargo/drivers#destroy", id: "1")
    end
  end
end
