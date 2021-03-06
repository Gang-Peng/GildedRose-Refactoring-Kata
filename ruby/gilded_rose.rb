require 'forwardable'
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update
    end
  end
end

class Item
  extend Forwardable
  def initialize(name, sell_in, quality)
    @rose = Rose.new(name, sell_in, quality)
  end

  def_delegators :@rose, :update, :sell_in, :quality, :to_s
end

class Rose
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def update
    if name != "Aged Brie" and name != "Backstage passes to a TAFKAL80ETC concert"
      if quality > 0
        if name != "Sulfuras, Hand of Ragnaros"
          @quality -= 1
        end
      end
    else
      if quality < 50
        @quality += 1
        if name == "Backstage passes to a TAFKAL80ETC concert"
          if sell_in < 11
            if quality < 50
              @quality += 1
            end
          end
          if sell_in < 6
            if quality < 50
              @quality += 1
            end
          end
        end
      end
    end
    if name != "Sulfuras, Hand of Ragnaros"
      @sell_in -= 1
    end
    if sell_in < 0
      if name != "Aged Brie"
        if name != "Backstage passes to a TAFKAL80ETC concert"
          if quality > 0
            if name != "Sulfuras, Hand of Ragnaros"
              @quality -= 1
            end
          end
        else
          @quality = 0
        end
      else
        if quality < 50
          @quality += 1
        end
      end
    end
  end
end

# TODO, create Rose class for each kind of roses which update sell_in and quality based on their own rules
