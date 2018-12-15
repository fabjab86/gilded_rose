require 'gilded_rose'
require 'generalitems'
require 'item'

describe GildedRose do

  # * Once the sell by date has passed, `quality` degrades twice as fast

  describe "quality change based on sell_in" do
    xit "reduces the quality by 2 if the sell_in has passed" do
      item = Item.new("Jam", 0, 4)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(2)
    end
  end

  # * The `quality` of an item is never negative

  describe "quality level" do
    xit "quality is never lower than zero" do
      item = Item.new("Oranges", 1, 0)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)
    end
  end

  # * Once the sell by date has passed, `quality` degrades twice as fast

  describe "quality after sell_in" do
    xit "degrades twice as fast" do
      item = Item.new("Grapes", 0, 2)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)
    end
  end

  # * "Aged Brie" actually increases in `quality` the older it gets

  describe "Aged Brie quality" do
    xit "increases in quality the older it gets" do
      item = Item.new("Aged Brie", 10, 6)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(7)
    end

    xit "has max 50 quality" do
      item = Item.new("Aged Brie", 10, 50)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end

    xit "the sel_in date reduces daily" do
      item = Item.new("Aged Brie", 10, 45)
      GildedRose.new([item]).update_quality
      GildedRose.new([item]).update_quality
      expect(item.sell_in).to eq(8)
    end
  end

  # * The `quality` of an item is never more than 50

  describe "items quality" do
    xit "is never more than 50" do
      item = Item.new("Aged Brie", 3, 50)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end

    xit "is never more than 50" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 50)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end
  end

  # # * "Sulfuras", being a legendary item, never has to be sold or decreases in
  # #   `quality`

  describe "Sulfuras" do
    xit "never decreses in quality" do
      item = Item.new("Sulfuras, Hand of Ragnaros", 5, 40)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(40)
    end

    xit "never has to be sold" do
      item = Item.new("Sulfuras, Hand of Ragnaros", 5, 40)
      GildedRose.new([item]).update_quality
      expect(item.sell_in).to eq(5)
    end
  end

  # # * "Backstage passes", like aged brie, increases in `quality` as its `sell_in` value
  # #   approaches; `quality` increases by 2 when there are 10 days or less and by 3
  # #   when there are 5 days or less but `quality` drops to 0 after the concert

  describe "Backstage passes" do

    xit "increases in quality by 1 if sell_in is greater than 10" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(26)
    end

    xit "increases twice in quality if the sell_in in 10 or less" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(27)
    end

    xit "increases twice in quality if the sell_in in 10 or less" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end

    xit "reduces sell_in by 1 if quality is 49" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 49)
      GildedRose.new([item]).update_quality
      expect(item.sell_in).to eq(11)
    end

    xit "reduces sell_in by 1 if quality is 50" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 50)
      GildedRose.new([item]).update_quality
      expect(item.sell_in).to eq(11)
    end

    xit "increases three times in quality if the sell_in in 5 or less" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(28)
    end

    xit "sets the quality to zero if sell_in is zero" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)
    end

    xit "has max 50 quality" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end

    xit 'only raises quality to 50 when quality is at 49' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end

    xit "increases quality by 1 if quality is more than 48 and sell_in is 5 or less" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end
  end

  # # * "Conjured" items degrade in `quality` twice as fast as normal items
   # quality can not be more then 50

  describe "Conjured items - no idea what they are..." do
    xit "degrades twice as fast as general items" do
      item = Item.new("Conjured", 4, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(23)
    end

    xit "decreses sell_in by 1 everyday" do
      item = Item.new("Conjured", 4, 25)
      GildedRose.new([item]).update_quality
      expect(item.sell_in).to eq(3)
    end

    xit "if sell_in is zero quality is zero" do
      item = Item.new("Conjured", 0, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)
    end

    xit "if quality is zero sell_in is zero" do
      item = Item.new("Conjured", 5, 0)
      GildedRose.new([item]).update_quality
      expect(item.sell_in).to eq(0)
    end
  end
end
