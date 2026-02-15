require "spec_helper"
require "cart"

RSpec.describe Cart do
  describe "#total_price and #total_tax" do
    it "sums items and tax" do
      products = [
        { quantity: 1, product_name: "book", price: 12.49, imported: false },
        { quantity: 1, product_name: "music CD", price: 14.99, imported: false }
      ]
      cart = Cart.new(products)
      expect(cart.items.size).to eq(2)
      expect(cart.total_price).to be_within(0.01).of(28.98)
      expect(cart.total_tax).to be > 0
    end
  end
end