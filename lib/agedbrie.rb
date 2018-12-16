require 'item'

class AgedBrie < Item
  def update_item
    @quality += 1 and @sell_in -= 1 if @sell_in > 0 and @quality < 50
  end
end
