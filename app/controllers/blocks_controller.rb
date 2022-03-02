class BlocksController < ApplicationController
  before_action :find_block, only: [:edit, :destroy, :switch, :switch_update]
  # вызывает ошибку мол несколько раз вызываю редирект
  # after_action :redirect_block, only: [:create, :update, :destroy]

  def create
    @block = BlockSave.(params)
    redirect_block
  end

  def update
    @block = BlockUpdate.(params.permit!)
    redirect_block
  end

  def edit
  end

  def destroy
    @block.destroy
    redirect_block
  end

  def switch
  end

  def switch_update
    if !params[:chapter_id].nil?
      @block.chapter = Chapter.find params[:chapter_id]
      @block.subsection = nil
      @block.save
    elsif !params[:subsection_id].nil?
      @block.subsection = Subsection.find params[:subsection_id]
      @block.chapter = nil
      @block.save
    end

    redirect_block
  end

  private

  def find_block
    @block = Block.find params[:id]
  end

  def redirect_block
    unless @block.nil?
      if @block.chapter.nil?
        redirect_to subsection_path(@block.subsection), notice: I18n.t('block.comments.edit')
      else
        redirect_to chapter_path(@block.chapter), notice: I18n.t('block.comments.edit')
      end
    else
      redirect_to root_path
    end
  end
end
