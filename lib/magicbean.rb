require 'item'

class MagicBean < Item

  def randomly
    rand(0..1)
  end

  def update_item
    @quality -= randomly if @quality > 0
  end
end
