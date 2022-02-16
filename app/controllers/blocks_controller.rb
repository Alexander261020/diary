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
    block = Block.find params[:id]
    if !params[:comment].blank? || !params[:content].blank? || !params[:lind].blank?
      params_block = {
        'content' => params[:content],
        'comment' => params[:comment],
        'link' => params[:link] }

      block.update(params_block)
    end

    redirect_to chapter_path(block.chapter)
  end

  private

  def block_params
    params.require(:block).permit(:comment, :content, :link)
  end
end
