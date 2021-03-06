class ChaptersController < ApplicationController
  before_action :find_chapter, only: [:show, :edit]

  def index
    @chapters = Chapter.order(count_clicks: :DESC)
    @last_updated_chapter = Chapter.order(updated_at: :desc).first
  end

  def new
    @chapter = Chapter.new
    @block = Block.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      flash[:success] = I18n.t('chapter.comments.create')
    else
      flash[:danger] = @chapter.errors[:name].first
    end

    BlockSave.(params)
    redirect_to root_path
  end

  def show
    # фиксируем клик, нужно для активности
    # LinkClickedJob.perform_later(@chapter)
    LinkClickedJob.set(wait: 10.second).perform_later(@chapter)
  end

  def edit
    @subsection = Subsection.new
    @block = Block.new
  end

  def update
    @chapter = Chapter.find params[:id]
    @chapter.update(chapter_params)

    flash[:success] = I18n.t('chapter.comments.edit')
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
