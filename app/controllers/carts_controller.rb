class CartsController < ApplicationController

  #before_filter :authorize # Uncomment if you wish to force users to login before adding to cart
  
  #add to any controller that you want to secure and force user to login
  #not sure if I want it for carts, but will be good to test here anyway

  def show
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
