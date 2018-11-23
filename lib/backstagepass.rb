class BackStagePass

  def backstage_pass(item)
    if item.sell_in == 0
      item.quality = 0
    elsif item.quality == 50 and item.sell_in > 0
      item.sell_in -= 1
    elsif item.quality <= 47 and item.sell_in <= 5
      item.quality += 3 and item.sell_in -= 1
    elsif item.quality <= 48 and item.sell_in <= 10
      item.quality += 2 and item.sell_in -= 1
    elsif item.quality < 50 and item.sell_in >= 10
      item.quality += 1 and item.sell_in -= 1
    end
  end
  
end
