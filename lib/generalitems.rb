class GeneralItems
  def general(item)
    if item.quality > 0
      if item.sell_in > 0
        reduce_both_by_one(item)
      elsif item.sell_in.zero?
        item.quality -= 2
      end
    else
      error_logger
    end
  end

  def reduce_both_by_one(item)
    item.quality -= 1 and item.sell_in -= 1
  end

  def error_logger
    return "There seems to be a problem, please try again"
  end
end
