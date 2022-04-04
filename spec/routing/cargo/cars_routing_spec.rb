require "rails_helper"

RSpec.describe Cargo::CarsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cargo/cars").to route_to("cargo/cars#index")
    end

    it "routes to #new" do
      expect(get: "/cargo/cars/new").to route_to("cargo/cars#new")
    end

    it "routes to #show" do
      expect(get: "/cargo/cars/1").to route_to("cargo/cars#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cargo/cars/1/edit").to route_to("cargo/cars#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cargo/cars").to route_to("cargo/cars#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cargo/cars/1").to route_to("cargo/cars#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cargo/cars/1").to route_to("cargo/cars#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cargo/cars/1").to route_to("cargo/cars#destroy", id: "1")
    end
  end
end
