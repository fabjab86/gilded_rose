class BackStagePass

  def backstage_pass(item)
    if item.sell_in == 0
      item.quality = 0
      if item.quality == 50
        item.sell_in -= 1
        if item.sell_in > 0
          item.sell_in -= 1
        end
      end
    elsif item.quality <= 47 and item.sell_in <= 5
      item.quality += 3
    elsif item.quality <= 48 and item.sell_in <= 10
      item.quality += 2
    elsif item.quality < 50 and item.sell_in > 4
      item.quality += 1
    end
  end

end
