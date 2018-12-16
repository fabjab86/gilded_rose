require 'sulfuras'

describe Sulfuras do
  # # * "Sulfuras", being a legendary item, never has to be sold or decreases in
  # #   `quality`

  describe "Sulfuras" do
    it "never decreses in quality" do
      item = Sulfuras.new("Sulfuras, Hand of Ragnaros", 5, 80)
      item.update_item
      expect(item.quality).to eq(80)
    end

    it "never has to be sold" do
      item = Sulfuras.new("Sulfuras, Hand of Ragnaros", 5, 80)
      item.update_item
      expect(item.sell_in).to eq(5)
    end
  end

end
