class Cargo::CustomersController < ApplicationController
  before_action :set_cargo_customer, only: %i[ show edit update destroy ]

  # GET /cargo/customers
  def index
    @cargo_customers = Cargo::Customer.all
  end

  # GET /cargo/customers/1
  def show
  end

  # GET /cargo/customers/new
  def new
    @cargo_customer = Cargo::Customer.new
  end

  # GET /cargo/customers/1/edit
  def edit
  end

  # POST /cargo/customers
  def create
    @cargo_customer = Cargo::Customer.new(cargo_customer_params)

    if @cargo_customer.save
      AddContact.(@cargo_customer, params)
      redirect_to @cargo_customer, notice: "Customer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cargo/customers/1
  def update
    if @cargo_customer.update(cargo_customer_params)
      AddContact.(@cargo_customer, params)
      redirect_to @cargo_customer, notice: "Customer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cargo/customers/1
  def destroy
    @cargo_customer.destroy
    redirect_to cargo_customers_url, notice: "Customer was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargo_customer
      @cargo_customer = Cargo::Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cargo_customer_params
      params.require(:cargo_customer).permit(:name, :inn, :ogrn, :passport, :adress)
    end
end
