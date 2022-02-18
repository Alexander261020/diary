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
    block = BlockUpdate.(block_params, params[:id])
    redirect_to chapter_path(block.chapter)
  end

  private

  def block_params
    params.require(:block).permit(:content, :comment, :link, :number_line)
  end
end
