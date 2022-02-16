class BlocksController < ApplicationController
  def create
  end

  def edit
  end

  def destroy
    @block = Block.find params[:id]
    @chapter = @block.chapter
    @block.destroy

    redirect_to chapter_path(@chapter)
  end
end
