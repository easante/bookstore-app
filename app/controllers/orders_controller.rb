class OrdersController < ApplicationController
  before_action :require_signin

  def new
    @order = Order.new
  end

end
