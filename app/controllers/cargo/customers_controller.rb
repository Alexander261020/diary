class Cargo::CustomersController < ApplicationController
  before_action :set_cargo_customer, only: %i[ show edit update destroy ]

  def index
    @cargo_customers = Cargo::Customer.all
  end

  def show
  end

  def new
    @cargo_customer = Cargo::Customer.new
  end

  def edit
  end

  def create
    @cargo_customer = Cargo::Customer.new(cargo_customer_params)

    if @cargo_customer.save
      AddContact.(@cargo_customer, params)
      flash[:success] = "Customer was successfully created."
      redirect_to @cargo_customer
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cargo_customer.update(cargo_customer_params)
      AddContact.(@cargo_customer, params)
      flash[:success] = "Customer was successfully updated."
      redirect_to @cargo_customer
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cargo_customer.destroy
    flash[:success] = "Customer was successfully destroyed."
    redirect_to cargo_customers_url
  end

  private

  def set_cargo_customer
    @cargo_customer = Cargo::Customer.find(params[:id])
  end

  def cargo_customer_params
    params.require(:cargo_customer).permit(:name, :inn, :ogrn, :passport, :adress)
  end
end
