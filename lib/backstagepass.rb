class BackStagePass

  def backstage_pass(item)
    if item.sell_in.zero?
      item.quality = 0
    elsif item.quality == 50
      item.sell_in -= 1
    elsif condition_for_increase_by_three(item)
      increase_by_three(item)
    elsif condition_for_increase_by_two(item)
      increase_by_two(item)
    elsif condition_for_quality_less_than_fifty(item)
      quality_less_than_fifty(item)
    end
  end

  def condition_for_increase_by_three(item)
    item.quality <= 47 and item.sell_in <= 5
  end

  def condition_for_increase_by_two(item)
    item.quality <= 48 and item.sell_in <= 10
  end

  def condition_for_quality_less_than_fifty(item)
    item.quality < 50 and item.sell_in > 4
  end

  def increase_by_three(item)
    item.quality += 3 and item.sell_in -= 1
  end

  def increase_by_two(item)
    item.quality += 2 and item.sell_in -= 1
  end

  def quality_less_than_fifty(item)
    item.quality += 1 and item.sell_in -= 1
  end

end
