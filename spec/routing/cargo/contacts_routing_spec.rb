require "rails_helper"

RSpec.describe Cargo::ContactsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cargo/contacts").to route_to("cargo/contacts#index")
    end

    it "routes to #new" do
      expect(get: "/cargo/contacts/new").to route_to("cargo/contacts#new")
    end

    it "routes to #show" do
      expect(get: "/cargo/contacts/1").to route_to("cargo/contacts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cargo/contacts/1/edit").to route_to("cargo/contacts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cargo/contacts").to route_to("cargo/contacts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cargo/contacts/1").to route_to("cargo/contacts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cargo/contacts/1").to route_to("cargo/contacts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cargo/contacts/1").to route_to("cargo/contacts#destroy", id: "1")
    end
  end
end
