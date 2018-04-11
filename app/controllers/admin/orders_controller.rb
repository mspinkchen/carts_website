class Admin::OrdersController < Admin::BaseController

def index
  @orders = Order.all
end

def edit
  @order = Order.find(params[:id])
end

def update
  @order = Order.update(order_params)
  flash[:notice] = "Update order status"
  redirect_to admin_orders_path
end

private
  def order_params
    params.require(:order).permit(:payment_status, :shipping_status)
  end

end