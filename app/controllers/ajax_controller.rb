class AjaxController < ApplicationController

  def customers_show
    @search_customers = params[:search_customers]
    @customers = []
    @customers = Cargo::Customer.where("name LIKE '%#{@search_customers}%'") if @search_customers.present?
  end

  def carriers_show
    @search_carriers = params[:search_carriers]
    @customers = []
    @customers = Cargo::Carrier.where("name LIKE '%#{@search_carriers}%'") if @search_carriers.present?
  end

  def cars
    @cars = Cargo::Carrier.find(params[:id_carrier]).cars
  end

  def drivers
    @drivers = Cargo::Carrier.find(params[:id_carrier]).drivers
  end

  def show
    @search = params[:search].downcase

    @chapters = Chapter.all.map do |chapter|
      chapter if chapter.name.downcase.include?(@search)
    end.compact

    @subsections = Subsection.all.map do |subsection|
      subsection if subsection.name.downcase.include?(@search)
    end.compact

    @blocks = Block.all.map do |block|
      block if block.content.downcase.include?(@search) || block.comment.downcase.include?(@search) || block.link.downcase.include?(@search)
    end.compact
  end
end
