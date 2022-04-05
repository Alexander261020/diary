class Cargo::CarsController < ApplicationController
  before_action :set_cargo_car, only: %i[ show edit update destroy ]
  before_action :set_cargo_carrier, only: %i[ new create ]

  # GET /cargo/cars/1
  def show
  end

  # GET /cargo/cars/new
  def new
    @cargo_car = Cargo::Car.new
  end

  # GET /cargo/cars/1/edit
  def edit
  end

  # POST /cargo/cars
  def create
    @cargo_car = Cargo::Car.new(cargo_car_params)
    @cargo_car.carrier = @carrier

    if @cargo_car.save
      @carrier.cars.push(@cargo_car)
      flash[:success] = "Car was successfully created."
      redirect_to @cargo_car
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cargo/cars/1
  def update
    if @cargo_car.update(cargo_car_params)
      flash[:success] = "Car was successfully updated."
      redirect_to @cargo_car
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cargo/cars/1
  def destroy
    @cargo_car.destroy
    flash[:success] = "Car was successfully destroyed."
    redirect_to cargo_carrier_path(@cargo_car.carrier)
  end

  private

  def set_cargo_carrier
    @carrier = Cargo::Carrier.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_cargo_car
    @cargo_car = Cargo::Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cargo_car_params
    params.require(:cargo_car).permit(:brand, :reg_mark, :p_mark)
  end
end
