module TaxCalculator
  BASIC_SALES_TAX_RATE = 0.10
  IMPORT_DUTY_RATE = 0.05


  def self.round_to_nearest_005(price)
    (20 * price).ceil / 20.0
  end

  def self.tax_per_unit(product_name, price, is_imported)
    # If the product is exempt and not imported, return 0.0
    return 0.0 if TaxRules.exempt?(product_name) && !is_imported
    tax_rate = 0.0
    tax_rate += BASIC_SALES_TAX_RATE if !TaxRules.exempt?(product_name)
    tax_rate += IMPORT_DUTY_RATE if is_imported
    # Round the tax to the nearest 0.05
    total_tax = round_to_nearest_005(price * tax_rate)
    total_tax
  end
end