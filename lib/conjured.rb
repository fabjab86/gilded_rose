class Conjured
  def conjured(item)
    if item.quality == 0 or item.sell_in == 0
      item.quality = 0 and item.sell_in = 0
    elsif item.quality < 50 and item.sell_in > 0
      item.quality -= 2 and item.sell_in -= 1
    end
  end
end
