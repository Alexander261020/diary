class ErrorsController < ApplicationController
  before_action :find_error, only: [:show]

  def index
    @errors = Error.all
  end

  def new
    @error = Error.new
  end

  def create
    @error = Error.create(error_params)
    redirect_to root_path
  end

  def show
  end

  private

  def find_error
    @error = Error.find params[:id]
  end

  def error_params
    params.require(:error).permit(:name, :description, :correct)
  end
end
