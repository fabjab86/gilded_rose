require_relative 'item'

class GeneralItems < Item

  def update_item
    @quality -= 2 if @sell_in.zero?
    @quality -= 1 and @sell_in -= 1 if @quality > 0 and @sell_in != 0
  end
end
