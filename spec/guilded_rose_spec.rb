require 'gilded_rose'
require 'backstagepass'
require 'generalitems'
require 'conjured'
require 'item'

describe GildedRose do
  it "calles the update_quality method on an array of items #BackStagePass" do
    item1 = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 3, 50)
    item2 = Conjured.new("Conjured", 4, 25)
    item3 = GeneralItems.new("Grapes", 5, 10)
    GildedRose.new([item1, item2, item3]).update_quality
    expect(item1.quality).to eq(50)
  end

  it "calles the update_quality method on an array of items #Conjured" do
    item1 = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 3, 50)
    item2 = Conjured.new("Conjured", 4, 25)
    item3 = GeneralItems.new("Grapes", 5, 10)
    GildedRose.new([item1, item2, item3]).update_quality
    expect(item2.quality).to eq(23)
  end

  it "calles the update_quality method on an array of items #GeneralItems" do
    item1 = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 3, 50)
    item2 = Conjured.new("Conjured", 4, 25)
    item3 = GeneralItems.new("Grapes", 5, 10)
    GildedRose.new([item1, item2, item3]).update_quality
    expect(item3.quality).to eq(9)
  end
end
