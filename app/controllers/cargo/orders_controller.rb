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
    @cargo_order = Cargo::Order.new

    if @cargo_order.save
      flash[:success] = "Order was successfully created."
      redirect_to cargo_orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cargo_order.update(cargo_order_params)
      flash[:success] = "Order was successfully updated."
      redirect_to cargo_orders_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cargo_order.destroy
    flash[:success] = "Order was successfully destroyed."
    redirect_to cargo_orders_url
  end

  private

  def set_cargo_order
    @cargo_order = Cargo::Order.find(params[:id])
  end

  def cargo_order_params
    params.require(:cargo_order).permit(:status)
  end
end
