class AjaxController < ApplicationController
  def show
    @search = params[:search].downcase

    @chapters = Chapter.all.map do |chapter|
      chapter if chapter.name.downcase.include?(@search)
    end.compact

    @subsections = Subsection.all.map do |subsection|
      subsection if subsection.name.downcase.include?(@search)
    end.compact

    @blocks = Block.all.map do |block|
      block if block.content.downcase.include?(@search) || block.comment.downcase.include?(@search) || block.link.downcase.include?(@search)
    end.compact
  end
end
