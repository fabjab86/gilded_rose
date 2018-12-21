require_relative 'item'

class BackStagePass < Item

  def update_item
    if sell_in.zero?
      @quality = 0
    elsif @quality == 50
      @sell_in -= 1
    elsif @quality < 50 and @quality != 0
      increase_by_one
      increase_by_two
      increase_by_three
    end
  end

  def increase_by_one
    @quality += 1 and @sell_in -= 1 if @quality != 50
  end

  def increase_by_two
    @quality += 1 and @sell_in -= 1 if @sell_in < 11 and @quality != 50
  end

  def increase_by_three
    @quality += 1 and @sell_in -= 1 if @sell_in < 6 and @quality != 50
  end

end
