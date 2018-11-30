class Legendary



  def initialize(item)
    @legendary_item = ["Sulfuras, Hand of Ragnaros"]
    @item = item

  end

  def update
    @legendary_item.include? @item


  end


end


legendary = Legendary.new("Sulfuras, Hand of Ragnaros")
p legendary.update
