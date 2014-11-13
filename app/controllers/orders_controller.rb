class OrdersController < ApplicationController
  before_action :require_signin
  before_action :set_cart

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build
    transfer_cart_items

    if @order.valid?
      total_sale = @cart.total_sale_in_cents

      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      token = params[:stripeToken]
       require 'pry';binding.pry

      begin
        charge = Stripe::Charge.create(
          amount: total_sale,
          currency: "usd",
          card: token
        )
        @order.save
        @cart.destroy
        session[:cart_id] = nil
        OrderMailer.notify_on_successful_order(current_user, @order).deliver
        flash[:success] = "Order has been created."
        redirect_to root_path
      rescue Stripe::CardError => e
        flash[:danger] = "Order has not been created.\n" + e.message
        redirect_to root_path
      end
    end
  end

private
  def transfer_cart_items
    @cart.cart_items.each do |item|
      @order.order_items << OrderItem.new(
        book_id: item.book_id,
        quantity: item.quantity,
        price: item.price
      )
    end
  end
end
