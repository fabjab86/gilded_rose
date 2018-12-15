require 'item'

# # * "Conjured" items degrade in `quality` twice as fast as normal items
 # quality can not be more then 50

class Conjured < Item
  def update_item
    @quality = 0 if @quality.zero? or @sell_in.zero?
    @quality -= 2 and @sell_in -= 1 if @quality > 1 and @sell_in > 0
  end
end
