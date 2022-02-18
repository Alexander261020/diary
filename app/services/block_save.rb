class BlockSave
  def self.call(params, chapter)
    # unless через || не отрабатывает, не знаю почему
    if !params[:comment].blank? || !params[:content].blank? || !params[:link].blank?
      params_block = {
        'content' => params[:content],
        'comment' => params[:comment],
        'link' => params[:link] }

      block = chapter.blocks.create(params_block)
    end

    block
  end
end
