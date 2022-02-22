class BlocksController < ApplicationController
  # вызывает ошибку несколько раз вызываю редирект
  # after_action :redirect_block, only: [:create, :update]

  def create
    @block = BlockSave.(params)
    redirect_block
  end

  def update
    @block = BlockUpdate.(params.permit!)
    redirect_block
  end

  def edit
    @block = Block.find params[:id]
  end

  def destroy
    @block = Block.find params[:id]
    @chapter = @block.chapter
    @block.destroy

    redirect_to chapter_path(@chapter)
  end

  private

  def redirect_block
    if @block.chapter.nil?
      redirect_to subsection_path(@block.subsection)
    else
      redirect_to chapter_path(@block.chapter)
    end
  end
end
