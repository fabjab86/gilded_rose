require_relative 'item'

class BackStagePass < Item
  
  def update_item
    @sell_in -= 1 if @quality == 50
    @quality += 1 and @sell_in -= 1 if @quality == 49
    increase_quality if quality > 0 and sell_in > 1
    @quality = 0 if sell_in.zero?
  end

  def increase_quality
    @quality += 1 and @sell_in -= 1 if sell_in > 10 and quality < 50
    @quality += 2 and @sell_in -= 1 if sell_in <= 10 and quality <= 48
    @quality += 1 and @sell_in -= 1 if sell_in <= 5 and quality < 50
  end

end
