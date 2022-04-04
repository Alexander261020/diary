class Cargo::ContactsController < ApplicationController
  before_action :set_cargo_contact, only: %i[ show edit update destroy ]

  # GET /cargo/contacts/1
  def show
  end

  # GET /cargo/contacts/new
  def new
    @cargo_contact = Cargo::Contact.new
  end

  # GET /cargo/contacts/1/edit
  def edit
  end

  # POST /cargo/contacts
  def create
    @cargo_contact = Cargo::Contact.new(cargo_contact_params)

    if @cargo_contact.save
      redirect_to @cargo_contact, notice: "Contact was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cargo/contacts/1
  def update
    if @cargo_contact.update(cargo_contact_params)
      redirect_to @cargo_contact, notice: "Contact was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cargo/contacts/1
  def destroy
    @cargo_contact.destroy
    redirect_to cargo_contacts_url, notice: "Contact was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cargo_contact
    @cargo_contact = Cargo::Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cargo_contact_params
    params.require(:cargo_contact).permit(:tel, :email)
  end
end
