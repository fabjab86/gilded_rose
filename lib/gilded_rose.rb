require_relative 'generalitems'
require_relative 'backstagepass'
require_relative 'agedbrie'
require_relative 'conjured'
require_relative 'sulfuras'

class GildedRose
  attr_reader :brie, :backstage, :sulfurasItem, :conjuredItem, :items, :generalitems, :agedbrie,
  :backstagepass, :conjured, :sulfuras

  def initialize(items, generalitems = GeneralItems.new, agedbrie = AgedBrie.new,
    backstagepass = BackStagePass.new, conjured = Conjured.new, sulfuras = Sulfuras.new)
    @items = items; @generalitems = generalitems; @agedbrie = agedbrie; @backstagepass = backstagepass
    @conjured = conjured; @sulfuras = sulfuras
    @brie = "Aged Brie"; @conjuredItem = "Conjured"
    @backstage = "Backstage passes to a TAFKAL80ETC concert"
    @sulfurasItem = "Sulfuras, Hand of Ragnaros"
  end

  def update_quality
    @items.each do |item|
      if (item.name != brie and item.name != backstage and
        item.name != sulfurasItem and item.name != conjuredItem)
        generalitems.general(item)
      elsif item.name == brie
        agedbrie.aged_brie(item)
      elsif item.name == backstage
        backstagepass.backstage_pass(item)
      elsif item.name == sulfurasItem
        sulfuras.sulfuras(item)
      elsif item.name == conjuredItem
        conjured.conjured(item)
      end
    end
  end

end
