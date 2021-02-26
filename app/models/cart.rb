# frozen_string_literal: true

class Cart < ApplicationRecord
  # has_many used with belongs_to creates an ability to traverse these relationships
  # in both directions
  # A cart potentially has many line_items
  # Linked by ID and the destroy method is dependent on the existence of the cart.
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end

    current_item
  end

  def total_price
    line_items.to_a.sum(&:total_price)
  end
  # cart = Cart.find()
  # puts "This cart has #{cart.line_items.count} line items"
end
