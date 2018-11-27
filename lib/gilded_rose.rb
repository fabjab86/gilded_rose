require_relative 'generalitems'
require_relative 'backstagepass'
require_relative 'agedbrie'
require_relative 'conjured'
require_relative 'sulfuras'
require_relative 'dependencies'

class GildedRose
  attr_reader :brie, :backstage, :sulfuras_item, :conjured_item, :items,
  :generalitems, :agedbrie, :backstagepass, :conjured, :sulfuras

  def initialize(
    items, generalitems = GeneralItems.new, agedbrie = AgedBrie.new,
    backstagepass = BackStagePass.new, conjured = Conjured.new,
    sulfuras = Sulfuras.new
  )
    @items = items; @generalitems = generalitems; @agedbrie = agedbrie;
    @backstagepass = backstagepass; @conjured = conjured; @sulfuras = sulfuras
    @brie = "Aged Brie"; @conjured_item = "Conjured"
    @backstage = "Backstage passes to a TAFKAL80ETC concert"
    @sulfuras_item = "Sulfuras, Hand of Ragnaros"
  end

  def update_quality
    @items.each do |item|
      if (item.name != brie and item.name != backstage and
        item.name != sulfuras_item and item.name != conjured_item)
        generalitems.general(item)
      elsif item.name == brie
        agedbrie.aged_brie(item)
      elsif item.name == backstage
        backstagepass.backstage_pass(item)
      elsif item.name == sulfuras_item
        sulfuras.sulfuras(item)
      elsif item.name == conjured_item
        conjured.conjured(item)
      end
    end
  end

end
