require_relative 'item'

class MagicBean < Item

  def randomly
    decrease_by = Kernel.rand(2)
  end

  def update_item
    @quality -= 1 if randomly == 1 and @quality > 0
  end
end
