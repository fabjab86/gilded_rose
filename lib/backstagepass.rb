require 'item'

class BackStagePass < Item

  def update_item
    @quality = 0 if @sell_in.zero?
    if quality_is_fifty
      sell_in_minus_one
    elsif sell_in_less_5
      quality_plus_three
    elsif sell_in_less_10
      quality_plus_two
    elsif quality_less_50
      quality_plus_one
    end
  end

  def quality_is_fifty
    @quality == 50
  end

  def sell_in_minus_one
    @sell_in -= 1
  end

  def sell_in_less_5
    @quality <= 47 and @sell_in <= 5 and @sell_in != 0
  end

  def quality_plus_three
    @quality += 3 and @sell_in -= 1
  end

  def sell_in_less_10
    @quality <= 48 and @sell_in <= 10 and @sell_in != 0
  end

  def quality_plus_two
    @quality += 2 and @sell_in -= 1
  end

  def quality_less_50
    @quality < 50 and @sell_in > 4 and @sell_in != 0
  end

  def quality_plus_one
    @quality += 1 and @sell_in -= 1
  end

end
