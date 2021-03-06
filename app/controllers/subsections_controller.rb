class SubsectionsController < ApplicationController
  before_action :find_subsection, only: [:show, :edit, :update, :destroy]

  def create
    chapter = Chapter.find params[:chapter_id]
    chapter.subsections.create(subsection_params)

    flash[:success] = I18n.t('subsection.comments.create')
    redirect_to chapter_path(chapter)
  end

  def update
    @subsection.update(subsection_params)

    flash[:success] = I18n.t('subsection.comments.edit')
    redirect_to subsection_path(@subsection)
  end

  def show
  end

  def edit
    @block = Block.new
  end

  def destroy
    @subsection.destroy
    flash[:danger] = I18n.t('subsection.destroy')
    redirect_to chapter_path(@subsection.chapter)
  end

  private

  def subsection_params
    params.require(:subsection).permit(:name)
  end

  def find_subsection
    @subsection = Subsection.find params[:id]
  end
end
