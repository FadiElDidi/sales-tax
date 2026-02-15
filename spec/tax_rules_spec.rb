require "spec_helper"
require "tax_rules"

RSpec.describe TaxRules do
  describe ".exempt?" do
    it "returns true for books, food, medical" do
      expect(TaxRules.exempt?("book")).to be true
      expect(TaxRules.exempt?("chocolate bar")).to be true
      expect(TaxRules.exempt?("headache pills")).to be true
    end

    it "returns false for miscellaneous items" do
      expect(TaxRules.exempt?("music CD")).to be false
      expect(TaxRules.exempt?("bottle of perfume")).to be false
    end
  end
end