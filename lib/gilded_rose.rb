class GildedRose

  def initialize(items)
    @items = items
    @lengendary_items = ["Sulfuras, Hand of Ragnaros"]
    @mature_quality_items = ["Aged Brie"]
    @ticket_items = ["Backstage passes to a TAFKAL80ETC concert"]
  end

  def update_quality
    @items.each do |item|
      @item = item
      if @lengendary_items.include? @item.name
        legendary
      elsif @mature_quality_items.include? @item.name
        mature_quality
        process
      elsif @ticket_items.include? @item.name
        ticket
        process
      else
        normal
        process
      end
    end
  end

  private

  def legendary
    # do nothing
  end

  def ticket
    if @item.sell_in <= 0
      @item.quality = 0
    elsif @item.sell_in < 6
      item_quality_increase_3
    elsif @item.sell_in < 11
      item_quality_increase_2
    else
      item_quality_increase_1
    end
  end

  def mature_quality
    in_date ? item_quality_increase_1 : item_quality_increase_2
  end

  def normal
    in_date ? item_quality_decrease_1 : item_quality_decrease_2
  end

  def process
    reduce_sell_in
    max_quality
    min_quality
  end

  def in_date
    @item.sell_in > 0
  end

  def reduce_sell_in
    @item.sell_in -= 1 unless @item.sell_in == 0
  end

  def min_quality
    @item.quality = 0 if @item.quality < 0
  end

  def max_quality
    @item.quality = 50 if @item.quality > 50
  end

  def item_quality_increase_1
    @item.quality += 1
  end

  def item_quality_increase_2
    @item.quality += 2
  end

  def item_quality_increase_3
    @item.quality += 3
  end

  def item_quality_decrease_1
    @item.quality -= 1
  end

  def item_quality_decrease_2
    @item.quality -= 2
  end



end
