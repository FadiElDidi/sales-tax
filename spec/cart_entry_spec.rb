require "spec_helper"
require "cart_entry"

RSpec.describe CartEntry do
  describe "#entry_tax" do
    it "multiplies tax_per_unit by quantity" do
      allow(TaxCalculator).to receive(:tax_per_unit).and_return(1.0)
      entry = CartEntry.new(quantity: 2, product_name: "music CD", price: 10.0, imported: false)
      expect(entry.entry_tax).to eq(2.0)
    end
  end

  describe "#after_tax_price" do
    it "is price * quantity + entry_tax rounded to 2 decimals" do
      allow(TaxCalculator).to receive(:tax_per_unit).and_return(1.0)
      entry = CartEntry.new(quantity: 2, product_name: "music CD", price: 10.0, imported: false)
      expect(entry.after_tax_price).to eq(22.0)
    end
  end
end