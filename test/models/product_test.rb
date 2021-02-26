# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  #   def new_product(image_url)
  #     Product.new(
  #       title: 'My book Title',
  #       description: "yyy",
  #       price: 1,
  #       image_url: image_url
  #     )
  #   end

  #   test "product attributes must not be empty" do
  #     product = Product.new
  #     assert product.invalid?
  #     assert product.errors[:title].any?
  #     assert product.errors[:image_url].any?
  #     assert product.errors[:description].any?
  #     assert product.errors[:price].any?
  #   end

  #    test "product must have a legitimate price" do
  #     product = Product.new(title: 'Book', description: 'some description', image_url: 'zzz.jpg')

  #     product.price = 0.01
  #     puts product[:price]
  #     assert product.invalid?
  #   end

  #   test "image url" do
  #     ok = %w{ fred.gif fred.jpg, fred.png http://a.b.c/x/y/z/fred.gif}
  #     bad = %w{ fred.doc, fred.gif/more, fred.pdf }

  #     ok.each do |image|
  #       assert new_product(image).valid?, "#{image} shouldn't be invalid"
  #     end

  #     bad.each do |image|
  #       assert new_product(image).invalid?, "#{image} shouldn't be valid"
  #     end
  #   end
  # end

  test 'product is not valid without a unique title' do
    product = Product.new(
      title: products(:ruby).title,
      description: 'yyy',
      price: 1,
      image_url: 'fred.gif'
    )

    assert product.invalid?
    assert_equal ['has already been taken'], product.errors[:title]
  end
end
