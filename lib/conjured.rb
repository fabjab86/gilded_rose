class Conjured
  def conjured(item)
    if item.quality.zero? or item.sell_in.zero?
      item.quality = 0 and item.sell_in = 0
    elsif item.quality > 1 and item.sell_in > 0
      item.quality -= 2 and item.sell_in -= 1
    end
  end
end
