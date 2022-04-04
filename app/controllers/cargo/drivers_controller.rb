class Cargo::DriversController < ApplicationController
  before_action :set_cargo_driver, only: %i[ show edit update destroy ]
  before_action :set_cargo_carrier, only: %i[ new create ]

  # GET /cargo/drivers/1
  def show
  end

  # GET /cargo/drivers/new
  def new
    @cargo_driver = Cargo::Driver.new
  end

  # GET /cargo/drivers/1/edit
  def edit
  end

  # POST /cargo/drivers
  def create
    @cargo_driver = Cargo::Driver.new(cargo_driver_params)
    @cargo_driver.carrier = @carrier

    if @cargo_driver.save
      AddContact.(@cargo_driver, params)
      @carrier.drivers.push(@cargo_driver)
      redirect_to @cargo_driver, notice: "Driver was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cargo/drivers/1
  def update
    if @cargo_driver.update(cargo_driver_params)
      AddContact.(@cargo_driver, params)
      redirect_to @cargo_driver, notice: "Driver was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cargo/drivers/1
  def destroy
    @cargo_driver.destroy
    redirect_to cargo_carrier_path(@cargo_driver.carrier), notice: "Driver was successfully destroyed."
  end

  private

  def set_cargo_carrier
    @carrier = Cargo::Carrier.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_cargo_driver
    @cargo_driver = Cargo::Driver.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cargo_driver_params
    params.require(:cargo_driver).permit(:name, :passport, :vy)
  end
end
