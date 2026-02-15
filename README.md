# Sales Tax Receipt

A Ruby application that computes sales tax and prints receipt details for shopping baskets, as specified in the coding exercise.

## Requirements

- Ruby 3.1+ (tested on 4.0.1)
- Bundler (for running tests)

## How to Run

From the project root:

```bash
ruby bin/receipt.rb <path-to-input-file>
```

## Testing

From the project root:

```bash
bundle exec rspec
```

## How it works

The application works by parsing the input file into a list of product hashes. This list is used to create a `Cart`, which maps each product to a `CartEntry`. The total tax and total price are calculated by summing the `entry_tax` and `after_tax_price` of each `CartEntry`. The receipt is then printed to the console using the `print_receipt` method.

The `TaxCalculator` module is used to calculate the tax per unit for a product based on whether it is imported and whether it is exempt from sales tax.

The `TaxRules` module is used to determine if a product is exempt from sales tax based on its category, which is inferred by matching keywords to the product name.


## Assumptions

- The input does not contain multiple lines with the same product name.
- The input file is a text file with the format `<quantity> (imported) <product_name> at <price>`

Example:
```text
1 book at 12.49
1 music CD at 14.99
1 imported chocolate bar at 0.85
```

## Compromises

For simplicity:

  - the application does not handle invalid input.
  - sales tax exempt items are categorized by matching hardcoded keywords, rather than a more sophisticated categorization algorithm. This can be improved by updating the `TaxRules` module.

### Verification

The included input files (`input_1.txt`, `input_2.txt`, `input_3.txt`) match the problem’s Input 1–3; running the program on each produces the expected Output 1–3.
