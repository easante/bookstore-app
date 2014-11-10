class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

  def order_total
    order_items.to_a.inject(0.0) { |sum, item| sum + item.quantity * item.price }
  end
end
