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

RSpec.describe "/cargo/contacts", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Cargo::Contact. As you add validations to Cargo::Contact, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Cargo::Contact.create! valid_attributes
      get cargo_contacts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      contact = Cargo::Contact.create! valid_attributes
      get cargo_contact_url(contact)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_cargo_contact_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      contact = Cargo::Contact.create! valid_attributes
      get edit_cargo_contact_url(contact)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Cargo::Contact" do
        expect {
          post cargo_contacts_url, params: { cargo_contact: valid_attributes }
        }.to change(Cargo::Contact, :count).by(1)
      end

      it "redirects to the created cargo_contact" do
        post cargo_contacts_url, params: { cargo_contact: valid_attributes }
        expect(response).to redirect_to(cargo_contact_url(Cargo::Contact.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Cargo::Contact" do
        expect {
          post cargo_contacts_url, params: { cargo_contact: invalid_attributes }
        }.to change(Cargo::Contact, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post cargo_contacts_url, params: { cargo_contact: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested cargo_contact" do
        contact = Cargo::Contact.create! valid_attributes
        patch cargo_contact_url(contact), params: { cargo_contact: new_attributes }
        contact.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the cargo_contact" do
        contact = Cargo::Contact.create! valid_attributes
        patch cargo_contact_url(contact), params: { cargo_contact: new_attributes }
        contact.reload
        expect(response).to redirect_to(cargo_contact_url(contact))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        contact = Cargo::Contact.create! valid_attributes
        patch cargo_contact_url(contact), params: { cargo_contact: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cargo_contact" do
      contact = Cargo::Contact.create! valid_attributes
      expect {
        delete cargo_contact_url(contact)
      }.to change(Cargo::Contact, :count).by(-1)
    end

    it "redirects to the cargo_contacts list" do
      contact = Cargo::Contact.create! valid_attributes
      delete cargo_contact_url(contact)
      expect(response).to redirect_to(cargo_contacts_url)
    end
  end
end