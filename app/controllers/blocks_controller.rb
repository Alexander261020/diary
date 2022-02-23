class BlocksController < ApplicationController
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
    @block = Block.find params[:id]
  end

  def destroy
    @block = Block.find(params[:id]).destroy
    redirect_block
  end

  private

  def redirect_block
    unless @block.nil?
      if @block.chapter.nil?
        redirect_to subsection_path(@block.subsection)
      else
        redirect_to chapter_path(@block.chapter)
      end
    else
      redirect_to root_path
    end
  end
end
