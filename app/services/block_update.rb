class BlockUpdate
  def self.call(params)
    block = Block.find params[:id]
    block.update(params[:block])
    block
  end
end
