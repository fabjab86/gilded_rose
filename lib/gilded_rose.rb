require_relative 'generalitems'
require_relative 'backstagepass'
require_relative 'agedbrie'
require_relative 'conjured'
require_relative 'sulfuras'

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
      if_general_items(item) ? generalitems.general(item) : error_logger
      if_aged_brie(item) ? aged_bire_method(item) : error_logger
      if_backstage(item) ? backstage_method(item) : error_logger
      if_sulfuras(item) ? sulfuras_method(item) : error_logger
      if_conjured(item) ? conjured_method(item) : error_logger
    end
  end

  def if_general_items(item)
    item.name != brie and item.name != backstage and
    item.name != sulfuras_item and item.name != conjured_item
  end

  def if_aged_brie(item)
    item.name == brie
  end

  def aged_bire_method(item)
    agedbrie.aged_brie(item)
  end

  def if_backstage(item)
    item.name == backstage
  end

  def backstage_method(item)
    backstagepass.backstage_pass(item)
  end

  def if_sulfuras(item)
    item.name == sulfuras_item
  end

  def sulfuras_method(item)
    sulfuras.sulfuras(item)
  end

  def if_conjured(item)
    item.name == conjured_item
  end

  def conjured_method(item)
    conjured.conjured(item)
  end

  def error_logger
    return "Please try again, there seems to be an error"
  end
end
