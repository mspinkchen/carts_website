class OrdersController < ApplicationController

  def create
    #手動確認使用者是否登入
    #如果沒有就存取一個order資訊，並且讓使用者登入
    if current_user.nil?
      session[:new_order_data] = params[:order]
      redirect_to new_user_session_path
    else
    #如果有，就建立一筆新訂單，並將curren_cart刪除
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      @order.sn = Time.now.to_i
      @order.amount = current_cart.subtotal
      @order.payment_status = "Not paid"
      @order.shipping_status = "Not shipped"

      current_cart.cart_items.each do |item|
      order_item = @order.order_items.build(product_id: item.product.id, price: item.product.price, quantity: item.quantity)
      order_item.save!
      end

      if @order.save
        UserMailer.notify_order_create(@order).deliver_now!
        current_cart.destroy
        session.delete(:new_order_data)
        redirect_to order_path(@order), notice: "new order created"
      else
        #如果訂單建立不成功，就回到購物車頁面
        @items = current_cart.cart_items
        render "carts/show"
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone, :address)
  end

 
end