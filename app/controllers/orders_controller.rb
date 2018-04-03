class OrdersController < ApplicationController

  def create
    #手動確認使用者是否登入
    #如果沒有就存取一個order資訊，並且讓使用者登入
    if current_user.nil?
      session[:new_order_data] = params[:order]
      redirect_to new_user_session_path
    else
    #如果有，就建立一筆新訂單，並將curren_cart刪除
      @order = current_user.orders.new(order_params)
      @order.sn = "Time.now.to_i"
      @order.amount = current_cart.subtotal

      if @order.save
        current_cart.destroy
        session.delete(:new_order_data)
        redirect_to orders_path(@order), notice: "new order created"
      else
        #如果訂單建立不成功，就回到購物車頁面
        @items = current_cart.cart_items
        render "carts/show"
      end
    end

  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:sn, :amount, :name, :phone, :address, :payment_status, :shipping_status)
  end

 
end