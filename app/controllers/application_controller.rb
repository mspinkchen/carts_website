class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  
  private

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


  def set_cart
    if session[:cart_id]
      @cart = Cart.find_by(id: session[:cart_id])
    end
    #沒有cart_id 所以做一個
    @cart ||= Cart.create
    #跟rails說我想要順取這個cart的資訊
    session[:cart_id] = @cart.id

    @cart
  end
  
end
