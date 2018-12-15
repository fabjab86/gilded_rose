require 'item'

class GeneralItems < Item

  def update_item
    @quality -= 1 if @quality > 0
    @sell_in -= 1 if @sell_in > 0
    @quality -= 2 if @sell_in.zero?
  end


  # def general(item)
  #   if item.quality > 0
  #     if item.sell_in > 0
  #       reduce_both_by_one(item)
  #     elsif item.sell_in.zero?
  #       item.quality -= 2
  #     end
  #   else
  #     error_logger
  #   end
  # end
  #
  # def reduce_both_by_one(item)
  #   item.quality -= 1 and item.sell_in -= 1
  # end
  #
  # def error_logger
  #   return "There seems to be a problem, please try again"
  # end
end
