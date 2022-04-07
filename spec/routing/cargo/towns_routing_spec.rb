require "rails_helper"

RSpec.describe Cargo::TownsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cargo/towns").to route_to("cargo/towns#index")
    end

    it "routes to #new" do
      expect(get: "/cargo/towns/new").to route_to("cargo/towns#new")
    end

    it "routes to #show" do
      expect(get: "/cargo/towns/1").to route_to("cargo/towns#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cargo/towns/1/edit").to route_to("cargo/towns#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cargo/towns").to route_to("cargo/towns#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cargo/towns/1").to route_to("cargo/towns#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cargo/towns/1").to route_to("cargo/towns#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cargo/towns/1").to route_to("cargo/towns#destroy", id: "1")
    end
  end
end
