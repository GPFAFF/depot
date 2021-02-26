# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :line_items

  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: /\. (gif|jpg|png)\z/i,
    message: 'must be a url for GIF, JPG or IMG'
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  # Hook method that rails calls automatically at a given point in an objects life
  # Here it is checking to that there aren't any line items in the cart before removing
  before_destroy :ensure_not_referenced_by_any_line_items

  private

  def ensure_not_referenced_by_any_line_items
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
