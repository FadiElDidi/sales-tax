class Cart
  attr_accessor :items

  def initialize(products)
    @items = []
    products.each do |product|
      add_item(product)
    end
  end

  def add_item(product)
    @items << CartEntry.new(product)
  end

  def total_price
    @items.sum(&:after_tax_price)
  end

  def total_tax
    @items.sum(&:entry_tax)
  end

  def print_receipt
    @items.each do |item|
      puts "#{item.quantity} #{item.product_name}: #{format('%.2f', item.after_tax_price)}"
    end
    puts "Sales Taxes: #{format('%.2f', total_tax)}"
    puts "Total: #{format('%.2f', total_price)}"
  end
end