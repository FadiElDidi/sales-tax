require "spec_helper"
require "tax_calculator"

RSpec.describe TaxCalculator do
  describe ".round_to_nearest_005" do
    it "rounds up to nearest 0.05" do
      expect(TaxCalculator.round_to_nearest_005(1.03)).to eq(1.05)
      expect(TaxCalculator.round_to_nearest_005(1.00)).to eq(1.00)
      expect(TaxCalculator.round_to_nearest_005(32.91)).to eq(32.95)
    end
  end

  describe ".tax_per_unit" do
    it "returns 0 for exempt, non-imported" do
      expect(TaxCalculator.tax_per_unit("book", 12.49, false)).to eq(0.0)
    end

    it "returns import tax only for imported exempt" do
      expect(TaxCalculator.tax_per_unit("box of chocolates", 10.00, true)).to eq(0.50)
    end

    it "returns basic tax for non-exempt" do
      expect(TaxCalculator.tax_per_unit("music CD", 14.99, false)).to eq(1.50)
    end

    it "returns basic tax and import tax for non-exempt imported" do
      expect(TaxCalculator.tax_per_unit("music CD", 14.99, true)).to eq(1.50 + 0.75)
    end
  end
end