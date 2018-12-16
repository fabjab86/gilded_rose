require 'item'

describe Item do

  describe "#to_s function" do
    it "prints the item name, quality and sell_in" do
      item = Item.new("someitem", 3, 5)
      expect(item.to_s).to eq("someitem, 3, 5")
    end
  end
end
