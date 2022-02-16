class BlocksController < ApplicationController
  def create
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

  def update
    block = BlockUpdate.(params)
    redirect_to chapter_path(block.chapter)
  end
end
