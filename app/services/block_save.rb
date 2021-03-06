class BlockSave
  def self.call(params)
    # надо будет как то покороче записать
    if !params[:chapter_id].nil?
      connect = Chapter.find params[:chapter_id]
    elsif !params[:subsection_id].nil?
      connect = Subsection.find params[:subsection_id]
    else
      return
    end

    block_params = params[:block]
    # unless через || не отрабатывает, не знаю почему
    if !block_params[:comment].blank? || !block_params[:content].blank? || !block_params[:link].blank?
      params_block = {
        'content' => block_params[:content],
        'comment' => block_params[:comment],
        'link' => block_params[:link],
        # присваиваем номер расположения блока
        'number_line' => connect.blocks.size + 1
      }

      block = connect.blocks.create(params_block)
    end

    block
  end
end
