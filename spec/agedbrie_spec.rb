require 'agedbrie'

describe AgedBrie do

  # * "Aged Brie" actually increases in `quality` the older it gets

  describe "Aged Brie quality" do
    it "increases in quality the older it gets" do
      item = AgedBrie.new("Aged Brie", 10, 6)
      item.update_item
      expect(item.quality).to eq(7)
    end

    it "has max 50 quality" do
      item = AgedBrie.new("Aged Brie", 10, 50)
      item.update_item
      expect(item.quality).to eq(50)
    end

    it "the sel_in date reduces daily" do
      item = AgedBrie.new("Aged Brie", 10, 45)
      item.update_item
      item.update_item
      expect(item.sell_in).to eq(8)
    end
  end

  # * The `quality` of an item is never more than 50

  describe "items quality" do
    it "is never more than 50" do
      item = AgedBrie.new("Aged Brie", 3, 50)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
    end
  end
end
