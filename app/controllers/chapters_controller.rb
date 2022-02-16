class ChaptersController < ApplicationController
  before_action :find_chapter, only: [:show, :edit]

  def index
    @chapters = Chapter.all
  end

  def new
    @chapter = Chapter.new
    @block = Block.new
  end

  def create
    @chapter = Chapter.create(chapter_params)
    BlockSave.(params, @chapter)

    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @chapter = Chapter.find params[:id]
    @chapter.update(chapter_params)
    BlockSave.(params, @chapter)

    redirect_to chapter_path(@chapter)
  end

  def destroy
    redirect_to root_path
  end

  private

  def chapter_params
    params.require(:chapter).permit(:name)
  end

  def find_chapter
    @chapter = Chapter.find(params[:id])
  end
end
