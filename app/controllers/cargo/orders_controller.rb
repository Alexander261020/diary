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
    text = params['text_order']
    name_folder = params['name_folder']
    path = "../../requests/requests/#{name_folder}"
    Dir.mkdir("#{path}") unless File.directory?("#{path}")
    # path = "../../requests/requests/#{path}/Заявка.docx"

    # file = File.new("#{path}","w")
    # file.write(text)
    path_img = "../../requests/requests/#{name_folder}/my_order.pnd"
    # img = File.open("#{path_img}","a")
    # file.import(img)
    # file.write(img)
    # File.write 'image.png', open('http://example.com/image.png').read
    # file.close unless file.nil?

    file = File.open("#{path_img}","a")
    file.write(text)
    file.print("Строка для записи в файл\n\r")
    file.puts "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS"
    file.close unless file.nil?
  end

  private

  def set_cargo_order
    @cargo_order = Cargo::Order.find(params[:id])
  end

  def cargo_order_params
    params.require(:cargo_order).permit(:status, :folder)
  end
end
