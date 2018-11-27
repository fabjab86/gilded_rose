class BackStagePass

  def backstage_pass(item)
    if sell_in_zero(item)
      zero_method(item)
    elsif q_fifty(item)
      q_fifty_method(item)
    elsif si_less_5(item)
      si_less_5_method(item)
    elsif si_less_10(item)
      si_less_10_method(item)
    elsif q_less_50(item)
      q_less_50_method(item)
    else
      error_logger
    end
  end

  def sell_in_zero(item)
    item.sell_in.zero?
  end

  def zero_method(item)
    item.quality = 0
  end

  def q_fifty(item)
    item.quality == 50
  end

  def q_fifty_method(item)
    item.sell_in -= 1
  end

  def si_less_5(item)
    item.quality <= 47 and item.sell_in <= 5
  end

  def si_less_5_method(item)
    item.quality += 3 and item.sell_in -= 1
  end

  def si_less_10(item)
    item.quality <= 48 and item.sell_in <= 10
  end

  def si_less_10_method(item)
    item.quality += 2 and item.sell_in -= 1
  end

  def q_less_50(item)
    item.quality < 50 and item.sell_in > 4
  end

  def q_less_50_method(item)
    item.quality += 1 and item.sell_in -= 1
  end

  def error_logger
    return "There seems to be a problem, please try again"
  end

end
