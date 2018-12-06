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
      legendary
      mature_quality
      ticket
      normal
    end
  end

  private

  def legendary
    # do nothing
  end

  def ticket
    return unless @ticket_items.include? @item.name
    if @item.sell_in <= 0
      @item.quality = 0
    elsif @item.sell_in < 6
      item_quality('+' ,3)
    elsif @item.sell_in < 11
      item_quality('+' ,2)
    else
      item_quality('+', 1)
    end
    process
  end

  def mature_quality
    return unless @mature_quality_items.include? @item.name
    in_date ? item_quality('+' ,1) : item_quality('+' ,2)
    process
  end

  def normal
    return if @mature_quality_items.include? @item.name
    return if @ticket_items.include? @item.name
    return if @lengendary_items.include? @item.name
    in_date ? item_quality('-' ,1) : item_quality('-' ,2)
    process
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

  def item_quality(divisor, amount)
    @item.quality += amount if divisor == '+'
    @item.quality -= amount if divisor == '-'
  end
end
