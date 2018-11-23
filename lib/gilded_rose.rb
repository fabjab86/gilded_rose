require_relative 'generalitems'
require_relative 'backstagepass'
require_relative 'agedbrie'
require_relative 'conjured'
require_relative 'sulfuras'

class GildedRose

  def initialize(items)
    @items = items
    generalitems = GeneralItems.new
    agedbrie = AgedBrie.new
    backstagepass = BackStagePass.new
    conjured = Conjured.new
    sulfuras = Sulfuras.new

    @generalitems = generalitems
    @agedbrie = agedbrie
    @backstagepass = backstagepass
    @conjured = conjured
    @sulfuras = sulfuras
  end

  def update_quality
    brie = "Aged Brie"
    backstage = "Backstage passes to a TAFKAL80ETC concert"
    sulfuras = "Sulfuras, Hand of Ragnaros"
    conjuredItem = "Conjured"

    @items.each do |item|
      if item.name != brie and item.name != backstage and item.name != sulfuras and item.name != conjuredItem
        @generalitems.general(item)
      elsif item.name == brie
        @agedbrie.aged_brie(item)
      elsif item.name == backstage
        @backstagepass.backstage_pass(item)
      elsif item.name == sulfuras
        @sulfuras.sulfuras(item)
      elsif item.name == conjuredItem
        @conjured.conjured(item)
      end
    end
  end
end
