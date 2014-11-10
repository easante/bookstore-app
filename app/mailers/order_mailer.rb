class OrderMailer < ActionMailer::Base
  def notify_on_successful_order(customer, order)
    @customer = customer
    @order = order

    mail from: 'Sales Department<sales@example.com>',
      to: @customer.email,
      subject: 'Order Confirmation'
  end
end
