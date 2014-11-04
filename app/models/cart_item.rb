class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :book

  def line_total
    price * quantity
  end
end
