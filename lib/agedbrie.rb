class AgedBrie
  def aged_brie(item)
    if item.sell_in > 0
      if item.quality == 50
        item.quality = 50
      elsif item.quality < 50
        less_than_fifty_method(item)
      end
    else
      error_logger
    end
  end

  def less_than_fifty_method(item)
    item.quality += 1 and item.sell_in -= 1
  end

  def error_logger
    return "There seems to be a problem, please try again"
  end
end
