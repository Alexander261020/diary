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
    BlockSave.(params)

    redirect_to root_path
  end

  def show
    # фиксируем клик, нужно для активности
    @chapter.count_clicks += 1
    @chapter.save
  end

  def edit
    @subsection = Subsection.new
    @block = Block.new
  end

  def update
    @chapter = Chapter.find params[:id]
    @chapter.update(chapter_params)

    redirect_to chapter_path(@chapter)
  end

  def destroy
    redirect_to root_path
  end

  private

  def chapter_params
    params.require(:chapter).permit(:name, :count_clicks)
  end

  def find_chapter
    @chapter = Chapter.find(params[:id])
  end
end
