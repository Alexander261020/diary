class Cargo::DriversController < ApplicationController
  before_action :set_cargo_driver, only: %i[ show edit update destroy ]
  before_action :set_cargo_carrier, only: %i[ new create ]

  def show
  end

  def new
    @cargo_driver = Cargo::Driver.new
  end

  def edit
  end

  def create
    @cargo_driver = Cargo::Driver.new(cargo_driver_params)
    @cargo_driver.carrier = @carrier

    if @cargo_driver.save
      AddContact.(@cargo_driver, params)
      @carrier.drivers.push(@cargo_driver)
      flash[:success] = "Driver was successfully created."
      redirect_to @cargo_driver
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cargo_driver.update(cargo_driver_params)
      AddContact.(@cargo_driver, params)
      flash[:success] = "Driver was successfully updated."
      redirect_to @cargo_driver
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cargo_driver.destroy
    flash[:success] = "Driver was successfully destroyed."
    redirect_to cargo_carrier_path(@cargo_driver.carrier)
  end

  private

  def set_cargo_carrier
    @carrier = Cargo::Carrier.find(params[:id])
  end

  def set_cargo_driver
    @cargo_driver = Cargo::Driver.find(params[:id])
  end

  def cargo_driver_params
    params.require(:cargo_driver).permit(:name, :passport, :vy)
  end
end
