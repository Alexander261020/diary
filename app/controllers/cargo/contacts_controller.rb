class Cargo::ContactsController < ApplicationController
  before_action :set_cargo_contact

  def edit
  end

  def update
    if @cargo_contact.update(cargo_contact_params)
      flash[:success] = "Contact was successfully updated."
      redirect_to cargo_customers_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cargo_contact.destroy
    flash[:success] = "Contact was successfully destroyed."
    redirect_to cargo_customers_path
  end

  private

  def set_cargo_contact
    @cargo_contact = Cargo::Contact.find(params[:id])
  end

  def cargo_contact_params
    params.require(:cargo_contact).permit(:name_contact, :tel, :email)
  end
end
