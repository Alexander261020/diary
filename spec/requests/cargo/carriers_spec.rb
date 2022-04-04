require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/cargo/carriers", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Cargo::Carrier. As you add validations to Cargo::Carrier, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Cargo::Carrier.create! valid_attributes
      get cargo_carriers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      carrier = Cargo::Carrier.create! valid_attributes
      get cargo_carrier_url(carrier)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_cargo_carrier_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      carrier = Cargo::Carrier.create! valid_attributes
      get edit_cargo_carrier_url(carrier)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Cargo::Carrier" do
        expect {
          post cargo_carriers_url, params: { cargo_carrier: valid_attributes }
        }.to change(Cargo::Carrier, :count).by(1)
      end

      it "redirects to the created cargo_carrier" do
        post cargo_carriers_url, params: { cargo_carrier: valid_attributes }
        expect(response).to redirect_to(cargo_carrier_url(Cargo::Carrier.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Cargo::Carrier" do
        expect {
          post cargo_carriers_url, params: { cargo_carrier: invalid_attributes }
        }.to change(Cargo::Carrier, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post cargo_carriers_url, params: { cargo_carrier: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested cargo_carrier" do
        carrier = Cargo::Carrier.create! valid_attributes
        patch cargo_carrier_url(carrier), params: { cargo_carrier: new_attributes }
        carrier.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the cargo_carrier" do
        carrier = Cargo::Carrier.create! valid_attributes
        patch cargo_carrier_url(carrier), params: { cargo_carrier: new_attributes }
        carrier.reload
        expect(response).to redirect_to(cargo_carrier_url(carrier))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        carrier = Cargo::Carrier.create! valid_attributes
        patch cargo_carrier_url(carrier), params: { cargo_carrier: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cargo_carrier" do
      carrier = Cargo::Carrier.create! valid_attributes
      expect {
        delete cargo_carrier_url(carrier)
      }.to change(Cargo::Carrier, :count).by(-1)
    end

    it "redirects to the cargo_carriers list" do
      carrier = Cargo::Carrier.create! valid_attributes
      delete cargo_carrier_url(carrier)
      expect(response).to redirect_to(cargo_carriers_url)
    end
  end
end