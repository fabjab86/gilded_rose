require_relative 'item'

class BackStagePass < Item

  def update_item
    @sell_in -= 1 if @quality == 50
    increase_by_one_if_quality_is_49
    increase_quality if sell_in > 1 and quality > 0
    @quality = 0 if sell_in.zero?
  end

  def increase_quality
    if_more_than_10_sell_in_days
    if_less_than_11_sell_in_days
    if_less_than_6_sell_in_days
  end

  def increase_by_one_if_quality_is_49
    @quality += 1 and @sell_in -= 1 if @quality == 49
  end

  def if_more_than_10_sell_in_days
    @quality += 1 and @sell_in -= 1 if sell_in > 10 and quality < 50
  end

  def if_less_than_11_sell_in_days
    @quality += 2 and @sell_in -= 1 if sell_in <= 10 and quality <= 48
  end

  def if_less_than_6_sell_in_days
    @quality += 1 and @sell_in -= 1 if sell_in <= 5 and quality < 50
  end

end
