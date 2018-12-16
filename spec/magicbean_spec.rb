require 'magicbean'

describe MagicBean do

  describe "magicbean quality" do
    it "it randomly decreases in quality by 1" do
      item = MagicBean.new("magicBean", 4, 5)
      item.stub(:randomly).and_return(1)
      item.update_item
      expect(item.quality).to eq(4)
    end

    it "it randomly decreases in quality by 0" do
      item = MagicBean.new("magicBean", 4, 5)
      item.stub(:randomly).and_return(0)
      item.update_item
      expect(item.quality).to eq(5)
    end

    it "is never less than zero" do
      item = MagicBean.new("magicBean", 4, 1)
      item.stub(:randomly).and_return(1)
      item.update_item
      expect(item.quality).to eq(0)
      item.update_item
      expect(item.quality).to eq(0)
    end

    it "it does not decreases in quality if quality is zero" do
      item = MagicBean.new("magicBean", 4, 0)
      item.update_item
      expect(item.quality).to eq(0)
    end
  end
end
