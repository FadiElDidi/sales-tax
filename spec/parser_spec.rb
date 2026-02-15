require "spec_helper"
require "parser"

RSpec.describe Parser do
  describe ".parse_line" do
    it "parses a simple line" do
      result = Parser.parse_line("2 book at 12.49")
      expect(result[:quantity]).to eq(2)
      expect(result[:product_name]).to eq("book")
      expect(result[:price]).to eq(12.49)
      expect(result[:imported]).to eq(false)
    end

    it "parses an imported line" do
      result = Parser.parse_line("1 imported bottle of perfume at 27.99")
      expect(result[:quantity]).to eq(1)
      expect(result[:product_name]).to eq("imported bottle of perfume")
      expect(result[:price]).to eq(27.99)
      expect(result[:imported]).to eq(true)
    end
  end

  describe ".parse_input" do
    it "parses multiple lines" do
      input = "2 book at 12.49\n1 chocolate bar at 0.85\n1 imported bottle of perfume at 27.99"
      result = Parser.parse_input(input)
      expect(result.size).to eq(3)
      expect(result[0][:product_name]).to eq("book")
      expect(result[0][:imported]).to eq(false)
      expect(result[1][:product_name]).to eq("chocolate bar")
      expect(result[2][:product_name]).to eq("imported bottle of perfume")
      expect(result[2][:imported]).to eq(true)
    end
  end
end