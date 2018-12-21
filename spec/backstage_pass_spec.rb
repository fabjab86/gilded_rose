require 'backstage_pass'
# # * "Backstage passes", like aged brie, increases in `quality` as its `sell_in` value
# #   approaches; `quality` increases by 2 when there are 10 days or less and by 3
# #   when there are 5 days or less but `quality` drops to 0 after the concert

describe BackStagePass do
  describe "Backstage passes" do

    it "is never more than 50" do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 3, 50)
      item.update_item
      expect(item.quality).to eq(50)
    end

    it "increases in quality by 1 if sell_in is greater than 10" do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 15, 25)
      item.update_item
      expect(item.quality).to eq(26)
    end

    it "increases twice in quality if the sell_in in 10 or less" do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 10, 25)
      item.update_item
      expect(item.quality).to eq(27)
    end

    it "increases twice in quality if the sell_in in 10 or less" do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)
      item.update_item
      expect(item.quality).to eq(50)
    end

    it "reduces sell_in by 1 if quality is 49" do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 12, 49)
      item.update_item
      expect(item.sell_in).to eq(11)
    end

    it "reduces sell_in by 1 if quality is 50" do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 12, 50)
      item.update_item
      expect(item.sell_in).to eq(11)
    end

    it "increases three times in quality if the sell_in in 5 or less" do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 5, 25)
      item.update_item
      expect(item.quality).to eq(28)
    end

    it "sets the quality to zero if sell_in is zero" do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 0, 25)
      item.update_item
      expect(item.quality).to eq(0)

    end

    it "has max 50 quality" do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)
      item.update_item
      expect(item.quality).to eq(50)
    end

    it 'only raises quality to 50 when quality is at 49' do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)
      item.update_item
      expect(item.quality).to eq(50)
    end

    it "increases quality by 1 if quality is more than 48 and sell_in is 5 or less" do
      item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)
      item.update_item
      expect(item.quality).to eq(50)
    end
  end
end
