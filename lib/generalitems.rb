require 'item'

class GeneralItems < Item

  def update_item
    @quality -= 1 if @quality > 0
    @sell_in -= 1 if @sell_in > 0
    @quality -= 2 if @sell_in.zero?
  end
end
