class Conjured
  def conjured(item)
    if either_is_zero(item)
      all_zero(item)
    elsif sell_in_zero(item)
      twice_degradation(item)
    else
      error_logger
    end
  end

  def either_is_zero(item)
    item.quality.zero? or item.sell_in.zero?
  end

  def all_zero(item)
    item.quality = 0 and item.sell_in = 0
  end

  def sell_in_zero(item)
    item.quality > 1 and item.sell_in > 0
  end

  def twice_degradation(item)
    item.quality -= 2 and item.sell_in -= 1
  end
  
  def error_logger
    return "There seems to be a problem, please try again"
  end
end
