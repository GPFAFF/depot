# frozen_string_literal: true

module CurrentCart
  private

  # Find current cart_id based off the session object
  # Locate that cart
  # Otherwise create a new cart
  # This allows us to share the cart among several controllers
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
