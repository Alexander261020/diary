class Cargo::CarriersController < ApplicationController
  before_action :set_cargo_carrier, only: %i[ show edit update destroy ]

  # GET /cargo/carriers
  def index
    @cargo_carriers = Cargo::Carrier.all
  end

  # GET /cargo/carriers/1
  def show
  end

  # GET /cargo/carriers/new
  def new
    @cargo_carrier = Cargo::Carrier.new
  end

  # GET /cargo/carriers/1/edit
  def edit
  end

  # POST /cargo/carriers
  def create
    @cargo_carrier = Cargo::Carrier.new(cargo_carrier_params)

    if @cargo_carrier.save
      AddContact.(@cargo_carrier, params)
      redirect_to @cargo_carrier, notice: "Carrier was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cargo/carriers/1
  def update
    if @cargo_carrier.update(cargo_carrier_params)
      AddContact.(@cargo_carrier, params)
      redirect_to @cargo_carrier, notice: "Carrier was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cargo/carriers/1
  def destroy
    @cargo_carrier.destroy
    redirect_to cargo_carriers_url, notice: "Carrier was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargo_carrier
      @cargo_carrier = Cargo::Carrier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cargo_carrier_params
      params.require(:cargo_carrier).permit(:name, :inn, :ogrn, :passport, :adress)
    end
end
