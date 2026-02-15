module TaxRules
  EXEMPT_CATEGORIES = ["book", "food", "medical"].freeze

  # Category map is a hash of categories and their keywords
  CATEGORY_MAP = {
    "book" => ["book"],
    "food" => ["chocolate"],
    "medical" => ["pills"]
  }.freeze

  def self.product_category(product_name)
    # Iterate over the category map and return the category if the product name 
    # matches any of the keywords. Return "miscellaneous" if no category is found.
    CATEGORY_MAP.each do |category, keywords|
      return category if keywords.any? { |keyword| product_name.include?(keyword) }
    end
    "miscellaneous"
  end

  def self.exempt?(product_name)
    EXEMPT_CATEGORIES.include?(product_category(product_name))
  end
end