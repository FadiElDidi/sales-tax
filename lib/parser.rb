module Parser
  def self.parse_line(line)
    # Split the line into keys and parse the keys
    # to get the quantity, product name, and price
    keys = line.strip.split(/\s+/)
    return nil if keys.empty?

    quantity = keys.shift.to_i
    price = keys.pop.to_f
    product_name = keys.reject { |key| key == "at" }.join(" ")
    imported = product_name.include?("imported")
    {
      quantity:,
      product_name:,
      price:,
      imported:
    }
  end

  def self.parse_input(input)
    # Split the input into lines and parse each line
    lines = input.strip.split("\n")
    lines.map { |line| parse_line(line) }.compact
  end
end