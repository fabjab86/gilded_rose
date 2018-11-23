class AgedBrie

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

end
