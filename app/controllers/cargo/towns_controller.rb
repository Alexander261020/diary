class Cargo::TownsController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  layout "cargo"

  before_action :set_cargo_town, only: %i[ show edit update destroy ]

  def parsing
    @uri = "https://ru.wikipedia.org/wiki/%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA_%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%B2_%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B8"

    File.delete('./log/dev/logfile.log')
    logger = Logger.new('./log/dev/logfile.log')

    doc = Nokogiri::HTML(URI.open(@uri))
    tbody = doc.css('tbody')

    tbody.css('tr').each.with_index do |tr, ind|
      if tr.css('td').size > 3
        name = tr.css('td')[2].css('a').text
        name = name.gsub(/(призн.)/, '') if name.match('призн.')
        region = tr.css('td')[3].css('a').text
        logger.debug "#{name.strip} - #{region}"
        Cargo::Town.create(title: name, region: region)
      end
    end

    redirect_to cargo_towns_path
  end

  # GET /cargo/towns
  def index
    @cargo_towns = Cargo::Town.all
  end

  # GET /cargo/towns/1
  def show
  end

  # GET /cargo/towns/new
  def new
    @cargo_town = Cargo::Town.new
  end

  # GET /cargo/towns/1/edit
  def edit
  end

  # POST /cargo/towns
  def create
    @cargo_town = Cargo::Town.new(cargo_town_params)

    if @cargo_town.save
      redirect_to @cargo_town, notice: "Town was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cargo/towns/1
  def update
    if @cargo_town.update(cargo_town_params)
      redirect_to @cargo_town, notice: "Town was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cargo/towns/1
  def destroy
    @cargo_town.destroy
    redirect_to cargo_towns_url, notice: "Town was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cargo_town
    @cargo_town = Cargo::Town.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cargo_town_params
    params.require(:cargo_town).permit(:name, :region)
  end
end
