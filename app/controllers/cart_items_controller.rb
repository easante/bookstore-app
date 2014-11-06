class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    cart_item = @cart.add_book_to_items(params[:book_id])
    respond_to do |format|
      if cart_item
        format.html { redirect_to cart_item.cart }
        format.js
      else
        format.html { redirect_to catalogs_path }
      end
    end
  end
end
