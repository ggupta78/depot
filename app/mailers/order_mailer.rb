class OrderMailer < ApplicationMailer
  default from: 'GG <gg@text.example.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @greeting = 'Hi'
    @order = order

    mail to: order.email, subject: 'Order received from Depot app'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @greeting = 'Hi'
    @order = order

    mail to: order.email, subject: 'Order shipped from Depot app'
  end
end
