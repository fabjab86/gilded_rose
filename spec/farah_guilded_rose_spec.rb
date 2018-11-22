require 'gilded_rose'
require 'item'

describe GildedRose do

  # * All items have a `sell_in` value which denotes the number of days we have to sell
  #   the item
  # * All items have a `quality` value which denotes how valuable the item is
  # * At the end of each day our system lowers both values for every item

  describe "Creating a new item" do
    it "has a name" do
      item = Item.new("Milk", 0, 0)
      expect(item.name).to eq "Milk"
    end

    it "has a sell_in" do
      item = Item.new("Grapes", 5, 10)
      expect(item.sell_in).to eq 5
    end

    it("has a quality") do
      item = Item.new("Butter", 4, 100)
      expect(item.quality).to eq(100)
    end
  end

  describe "#update item" do
    it "updates item sell_in" do
      item = Item.new("Pasta", 5, 10)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(9)
    end

    it "updates the quality" do
      item = Item.new("Sugar", 4, 4)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(3)
    end
  end

  # * Once the sell by date has passed, `quality` degrades twice as fast

  describe "quality change based on sell_in" do
    it "reduces the quality by 2 if the sell_in has passed" do
      item = Item.new("Jam", 0, 4)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(2)
    end
  end

  # * The `quality` of an item is never negative

  describe "quality level" do
    it "quality is never lower than zero" do
      item = Item.new("Oranges", 1, 0)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)
    end
  end

  # * Once the sell by date has passed, `quality` degrades twice as fast

  describe "quality after sell_in" do
    it "degrades twice as fast" do
      item = Item.new("Grapes", 0, 2)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)
    end
  end

  # * "Aged Brie" actually increases in `quality` the older it gets

  describe "Aged Brie quality" do
    it "increases in quality the older it gets" do
      item = Item.new("Aged Brie", 10, 6)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(7)
    end

    it "raises quality by two after a day" do
      item = Item.new("Aged Brie", 0, 0)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(2)
    end

  end

  # * The `quality` of an item is never more than 50

  describe "items quality" do
    it "is never more than 50" do
      item = Item.new("Aged Brie", 3, 50)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end

    it "is never more than 50" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 50)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end
  end

  # * "Sulfuras", being a legendary item, never has to be sold or decreases in
  #   `quality`

  describe "Sulfuras" do
    it "never decreses in quality" do
      item = Item.new("Sulfuras, Hand of Ragnaros", 5 , 40)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(40)
    end

    it "never has to be sold" do
      item = Item.new("Sulfuras, Hand of Ragnaros", 5 , 40)
      GildedRose.new([item]).update_quality
      expect(item.sell_in).to eq(5)
    end
  end

  # * "Backstage passes", like aged brie, increases in `quality` as its `sell_in` value
  #   approaches; `quality` increases by 2 when there are 10 days or less and by 3
  #   when there are 5 days or less but `quality` drops to 0 after the concert

  describe "Backstage passes" do

    it "increases in quality by 1" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(26)
    end

    it "increases twice in quality if the sell_in in 10 or less" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(27)
    end

    it "increases three times in quality if the sell_in in 10 or less" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(28)
    end

    it "increases three times in quality if the sell_in in 10 or less" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)
    end

    it "has max 50 quality" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end

  end

  # * "Conjured" items degrade in `quality` twice as fast as normal items

  describe "Conjured items - no idea what they are..." do
    xit "degrades twice as fast as general items" do
      item = Item.new("Conjured", 4, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(23)
    end
  end
end
