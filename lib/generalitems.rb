class GeneralItems
  def general(item)
    if item.quality > 0
      if item.sell_in > 0
        item.quality -= 1 and item.sell_in -= 1
      elsif item.sell_in = 0
        item.quality -= 2
      end
    end
  end
end
