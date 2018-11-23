class GildedRose

  def initialize(items)
    @items = items
  end

  def general(item)
    if item.quality == 0 and item.sell_in > 0
      item.sell_in -= 1
    elsif item.quality > 0 and item.sell_in > 0
      item.quality -= 1 and item.sell_in -= 1
    elsif item.quality > 0 and item.sell_in = 0
        item.quality -= 2
    end
  end

  def aged_brie(item)
    if item.quality == 50 and item.sell_in > 0
      item.sell_in -= 1
    elsif item.quality == 49 and item.sell_in > 0
      item.quality += 1 and item.sell_in -= 1
    elsif item.quality < 49 and item.sell_in == 0
      item.quality += 2
    else item.quality < 50 and item.sell_in == 0
      item.quality += 1
    end
  end

  def sulfuras(item)
    item.quality = item.quality and item.sell_in = item.sell_in
  end

  def backstage_pass(item)
    if item.sell_in == 0
      item.quality = 0
    elsif item.quality == 50 and item.sell_in > 0
      item.sell_in -= 1
    elsif item.quality <= 47 and item.sell_in <= 5
      item.quality += 3 and item.sell_in -= 1
    elsif item.quality <= 48 and item.sell_in <= 10
      item.quality += 2 and item.sell_in -= 1
    elsif item.quality < 50 and item.sell_in >= 10
      item.quality += 1 and item.sell_in -= 1
    end
  end

  def conjured(item)
    
  end

  def update_quality
    brie = "Aged Brie"
    backstage = "Backstage passes to a TAFKAL80ETC concert"
    sulfuras = "Sulfuras, Hand of Ragnaros"
    conjured = "Conjured"

    @items.each do |item|
      if item.name != brie and item.name != backstage and item.name != sulfuras
        general(item)
      elsif item.name == brie
        aged_brie(item)
      elsif item.name == backstage
        backstage_pass(item)
      else item.name == sulfuras
        sulfuras(item)
      end
    end
  end


end
