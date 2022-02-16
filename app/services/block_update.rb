class BlockUpdate
  def self.call(params)
    # unless через || не отрабатывает, не знаю почему
    block = Block.find params[:id]

    if !params[:comment].blank? || !params[:content].blank? || !params[:lind].blank?
      params_block = {
        'content' => params[:content],
        'comment' => params[:comment],
        'link' => params[:link] }

      block.update(params_block)
    end

    block
  end
end
