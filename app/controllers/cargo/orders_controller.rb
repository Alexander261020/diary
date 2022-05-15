require 'iconv'
require 'htmltoword'

class Cargo::OrdersController < ApplicationController
  layout "cargo"

  before_action :set_cargo_order, only: [:show, :edit, :update, :destroy, :doc]

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
    if params['order_adress_load'].present?
      if Cargo::AdressLoad.find_by(adress: params['order_adress_load']).present?
        adress_load = Cargo::AdressLoad.find_by(adress: params['order_adress_load'])
      else
        adress_load = Cargo::AdressLoad.new(adress: params['order_adress_load'])
      end

      @cargo_order.adress_load = adress_load
      adress_load.customer = @cargo_order.customer
      adress_load.save
    end

    text = params['text_order']
    name_folder = params['name_folder']
    path = "../../requests/requests/#{name_folder}"
    Dir.mkdir("#{path}") unless File.directory?("#{path}")

    path_file = "../../requests/requests/#{name_folder}/my_order.html"
    path_img = "../../requests/requests/#{name_folder}/signature.png"
    path_docx = "../../requests/requests/#{name_folder}/my_order.docx"
  end

  private

  def set_cargo_order
    @cargo_order = Cargo::Order.find(params[:id])
  end

  def cargo_order_params
    params.require(:cargo_order).permit(:status, :folder)
  end
end
