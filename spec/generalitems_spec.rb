require 'generalitems'

# * All items have a `sell_in` value which denotes the number of days we have to sell
#   the item
# * All items have a `quality` value which denotes how valuable the item is
# * At the end of each day our system lowers both values for every item


describe GeneralItems do
  describe "Creating a new item" do
    it "has a name" do
      item = GeneralItems.new("Milk", 0, 0)
      expect(item.name).to eq "Milk"
    end

    it "has a sell_in" do
      item = GeneralItems.new("Grapes", 5, 10)
      expect(item.sell_in).to eq 5
    end

    it"has a quality" do
      item = GeneralItems.new("Butter", 4, 100)
      expect(item.quality).to eq(100)
    end
  end

  describe "#update item" do
    it "updates item sell_in" do
      item = GeneralItems.new("Pasta", 5, 10)
      item.update_item
      expect(item.quality).to eq(9)
    end

    it "updates the quality" do
      item = GeneralItems.new("Sugar", 4, 4)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(3)
    end
  end
end
