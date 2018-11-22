class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    brie = "Aged Brie"
    backstage = "Backstage passes to a TAFKAL80ETC concert"
    sulfuras = "Sulfuras, Hand of Ragnaros"

    @items.each do |item|
      # step 1
      if item.name != brie and item.name != backstage
        if item.quality > 0 and item.name != sulfuras
            item.quality = item.quality - 1
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          # step 2
          if item.name == backstage
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != sulfuras
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != brie
          if item.name != backstage
            if item.quality > 0
              if item.name != sulfuras
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
