require_relative 'item'

class MagicBean < Item

  def randomly
    rand(2)
  end

  def update_item
    @quality -= randomly if @quality > 0
  end
end
