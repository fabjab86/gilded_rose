require_relative 'item'

class MagicBean < Item

  def update_item
    decrease_by = Kernel.rand(2)
    @quality -= 1 if decrease_by == 1 and @quality > 0
  end
end
