# frozen_string_literal: true

class LineItem < ApplicationRecord
  # defines an accessor method
  # tells rails that rows in line_items are the children of rows in carts and products
  # no line item can exist unless the corresponding carts and product rows exist
  # Great rule of thumb - if a table has any columns whose values consist of ID values for another table, use `belongs_to` AKA foreign_keys.
  # This adds the navigation capabilities between model objects.
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end
end
