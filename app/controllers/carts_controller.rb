class CartsController < ApplicationController
  def show 
    @cart = current_cart
    @items = current_cart.cart_items

    #如果有session :new_order_data存在，就依照session建立訂單
    #或是直接建立訂單
    if session[:new_order_data].present?
      @order = Order.new(session[:new_order_data])
    else
      @order = Order.new
    end

  end
end