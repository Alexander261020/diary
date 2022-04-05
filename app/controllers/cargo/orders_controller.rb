class Cargo::OrdersController < ApplicationController
  layout "cargo"

  before_action :set_cargo_order, only: %i[ show edit update destroy ]

  # GET /cargo/orders
  def index
    @cargo_orders = Cargo::Order.all
  end

  # GET /cargo/orders/1
  def show
  end

  # GET /cargo/orders/new
  def new
    @cargo_order = Cargo::Order.new
  end

  # GET /cargo/orders/1/edit
  def edit
  end

  # POST /cargo/orders
  def create
    @cargo_order = Cargo::Order.new(cargo_order_params)

    if @cargo_order.save
      redirect_to @cargo_order, notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cargo/orders/1
  def update
    if @cargo_order.update(cargo_order_params)
      redirect_to @cargo_order, notice: "Order was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cargo/orders/1
  def destroy
    @cargo_order.destroy
    redirect_to cargo_orders_url, notice: "Order was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargo_order
      @cargo_order = Cargo::Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cargo_order_params
      params.require(:cargo_order).permit(:status)
    end
end
