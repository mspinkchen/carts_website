class UserMailer < ApplicationMailer
  #寄件者及顯示名稱
  default from:"My Cart <info@mspink.co"

  #呼叫訂單成立通知信
  def notify_order_create(order)
    @order = order
    @content = "Your order is created. Thank you!"

  #收件者名稱與主旨

    mail to: order.user.email,
    subject: "Mspink | 訂單成立: #{@order.id}"
  end


end
