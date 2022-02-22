class SubsectionsController < ApplicationController
  before_action :find_subsection, only: [:show, :edit, :update]

  def create
    chapter = Chapter.find params[:chapter_id]
    chapter.subsections.create(subsection_params)

    redirect_to chapter_path(chapter)
  end

  def update
    @subsection.update(subsection_params)

    redirect_to subsection_path(@subsection)
  end

  def show
  end

  def edit
    @block = Block.new
  end

  private

  def subsection_params
    params.require(:subsection).permit(:name)
  end

  def find_subsection
    @subsection = Subsection.find params[:id]
  end
end
