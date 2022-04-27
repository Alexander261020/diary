require 'iconv'

class Cargo::OrdersController < ApplicationController
  layout "cargo"

  before_action :set_cargo_order, only: [:show, :edit, :update, :destroy]

  def index
    @cargo_orders = Cargo::Order.where('status < 3').order(id: :desc)
  end

  def arhive
    @cargo_orders = Cargo::Order.where('status > 2').order(id: :desc)
    render "index"
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
    AddReference.(@cargo_order, params)

    if @cargo_order.save
      flash[:success] = "Order was successfully created."
      redirect_to cargo_orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    AddReference.(@cargo_order, params)

    if @cargo_order.update(cargo_order_params)
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

  def exist
  end

  def folder
    path = "../../requests/requests/#{params[:name_folder]}"
    Dir.mkdir("#{path}") unless File.directory?("#{path}")
  end

  def doc
    # params.ssss
    path = "../../requests/requests/22-04-27 FOLDER"
    Dir.mkdir("#{path}") unless File.directory?("#{path}")
    path = "../../requests/requests/22-04-27 FOLDER/Заявка.docx"
    # File::ftype("#{path}").sssss
    File.new("#{path}","a")
  end

  private

  def set_cargo_order
    @cargo_order = Cargo::Order.find(params[:id])
  end

  def cargo_order_params
    params.require(:cargo_order).permit(:status, :folder)
  end
end
