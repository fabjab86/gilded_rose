require 'conjured'

describe Conjured do

  # # * "Conjured" items degrade in `quality` twice as fast as normal items
   # quality can not be more then 50

  describe "Conjured items - no idea what they are..." do
    it "degrades twice as fast as general items" do
      item = Conjured.new("Conjured", 4, 25)
      item.update_item
      expect(item.quality).to eq(23)
    end

    it "decreses sell_in by 1 everyday" do
      item = Conjured.new("Conjured", 4, 25)
      item.update_item
      expect(item.sell_in).to eq(3)
    end

    it "if sell_in is zero quality is zero" do
      item = Conjured.new("Conjured", 0, 25)
      item.update_item
      expect(item.quality).to eq(0)
    end
  end
end
