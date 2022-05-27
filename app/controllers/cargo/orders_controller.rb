require 'iconv'
require 'htmltoword'

class Cargo::OrdersController < ApplicationController
  layout "cargo"

  before_action :set_cargo_order, except: [:index, :arhive, :new, :create]

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

      adress_load.customer = @cargo_order.customer
      @cargo_order.adress_load = adress_load
      adress_load.save
    end

    if params['order_adress_reload'].present?
      if Cargo::AdressReload.find_by(adress: params['order_adress_reload']).present?
        adress_reload = Cargo::AdressReload.find_by(adress: params['order_adress_reload'])
      else
        adress_reload = Cargo::AdressReload.new(adress: params['order_adress_reload'])
      end

      adress_reload.customer = @cargo_order.customer
      @cargo_order.adress_reload = adress_reload
      adress_reload.save
    end

    @cargo_order.date_load = params['order_date_load'] if params['order_date_load'].present?
    @cargo_order.date_reload = params['order_date_reload'] if params['order_date_reload'].present?

    if params['gruz_weight'].present? || params['gruz_what_is'].present? || params['gruz_volume'].present?
      if  Cargo::Gruz.find_by(weight: params['gruz_weight'], volume: params['gruz_volume'], what_is: params['gruz_what_is']).present?
        gruz = Cargo::Gruz.find_by(weight: params['gruz_weight'], volume: params['gruz_volume'], what_is: params['gruz_what_is'])
      else
        gruz = Cargo::Gruz.new(weight: params['gruz_weight'], volume: params['gruz_volume'], what_is: params['gruz_what_is'])
        gruz.save
      end
    end

    @cargo_order.gruz = gruz
    @cargo_order.save
    unless @cargo_order.customer.gruzs.include?(gruz)
      @cargo_order.customer.gruzs.push(gruz)
    end

    text = params['text_order']
    name_folder = params['name_folder']
    path = "../../requests/requests/#{name_folder}"
    Dir.mkdir("#{path}") unless File.directory?("#{path}")

    path_file = "../../requests/requests/#{name_folder}/my_order.html"
    path_img = "../../requests/requests/#{name_folder}/signature.png"
    path_docx = "../../requests/requests/#{name_folder}/my_order.docx"
  end

  def file_exist
    @customer = @cargo_order.customer
  end

  def file_exist_i
    @customer = Cargo::Customer.find 1
    render "file_exist"
  end

  private

  def set_cargo_order
    @cargo_order = Cargo::Order.find(params[:id])
  end

  def cargo_order_params
    params.require(:cargo_order).permit(:status, :folder)
  end
end
