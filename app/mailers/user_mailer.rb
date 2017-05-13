class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt(order)
    @order = order
    @url = 'http://0.0.0.0:3000/order/#{@order.id}'
    mail(to: @order.email, subject: "Order Confirmation (#{@order.id})")
  end
end
