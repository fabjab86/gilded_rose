require 'item'

class Conjured < Item
  def update_item
    @quality = 0 if @quality.zero? or @sell_in.zero?
    @quality -= 2 and @sell_in -= 1 if @quality > 1 and @sell_in > 0
  end
end
