require "./block.cr"

class ChainStorage
  def initialize(@blockchain : Blockchain)
    Dir.mkdir ".blocks" unless File.exists? ".blocks"
    
    @blockchain.on_block do |block|
      File.write ".blocks/#{block.hash}", block.to_json
    end
  end

  def read
    Dir.open(".blocks/").each_child do |filename|
      file = File.read ".blocks/#{filename}"
      block = Block.from_json file
      @blockchain.add_relayed_block block
    end
  end
end