class BlockUpdate
  def self.call(params, id)
    block = Block.find id
    block.update(params)
    block
  end
end
