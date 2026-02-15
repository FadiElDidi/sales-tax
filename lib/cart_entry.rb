class CartEntry
  attr_accessor :quantity, :product_name, :price, :imported

  def initialize(product)
    @quantity = product[:quantity]
    @product_name = product[:product_name]
    @price = product[:price]
    @imported = product[:imported]
  end

  def entry_tax
    # Entry tax is the tax per unit multiplied by the quantity
    TaxCalculator.tax_per_unit(@product_name, @price, @imported) * @quantity
  end

  def after_tax_price
    (@price * @quantity + entry_tax).round(2)
  end
end