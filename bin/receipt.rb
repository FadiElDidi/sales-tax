PROJECT_ROOT = File.expand_path("..", __dir__)
$LOAD_PATH.unshift(File.join(PROJECT_ROOT, "lib"))

require "tax_rules"
require "parser"
require "tax_calculator"
require "cart"
require "cart_entry"

input_path = ARGV[0]
raise "Input file is required" if input_path.nil?

input_file = File.read(input_path)
products = Parser.parse_input(input_file)
cart = Cart.new(products)
cart.print_receipt