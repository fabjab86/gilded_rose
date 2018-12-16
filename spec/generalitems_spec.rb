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
      item.update_item
      expect(item.quality).to eq(3)
    end
  end

  # * Once the sell by date has passed, `quality` degrades twice as fast
  describe "quality change based on sell_in" do
    it "reduces the quality by 2 if the sell_in has passed" do
      item = GeneralItems.new("Jam", 0, 4)
      item.update_item
      expect(item.quality).to eq(2)
    end
  end

  # * The `quality` of an item is never negative
  describe "quality level" do
    it "quality is never lower than zero" do
      item = GeneralItems.new("Oranges", 1, 0)
      item.update_item
      expect(item.quality).to eq(0)
    end
  end

  # * Once the sell by date has passed, `quality` degrades twice as fast
  describe "quality after sell_in" do
    it "degrades twice as fast" do
      item = GeneralItems.new("Grapes", 0, 2)
      item.update_item
      expect(item.quality).to eq(0)
    end
  end
end
