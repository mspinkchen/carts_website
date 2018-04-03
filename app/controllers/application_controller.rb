class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  
  private

  def after_sign_in_path(resource)
    #如果有新訂單，尋找購物車資訊，並回到購物車頁面
    if session[:new_order_data].present?
      @cart = Cart.find(session[:cart_id])
      cart_path(@cart)
    #如果沒有就繼承
    else
      super
    end
  end

  def authenticate_admin
    if !current_user.admin?
      flash[alert]="Page doesn't exist"
      redirect_to root_path
    end
  end
  #未來需要在controller 跟 view使用，所以存取這個變數
  def current_cart
    @cart || set_cart
  end


  def set_cart  #根據session搜尋特定id
    if session[:cart_id]
      @cart = Cart.find_by(id: session[:cart_id])
    end
    #沒有cart_id 所以做一個
    @cart ||= Cart.create
    #跟rails說我想要存取這個cart的資訊
    session[:cart_id] = @cart.id

    @cart
  end


  
end
