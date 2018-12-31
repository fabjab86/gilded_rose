require_relative 'item'

class MagicBean < Item

  def randomly
    Kernel.rand(2)
  end

  def update_item
    @quality -= 1 if randomly == 1 and @quality > 0
  end
end
