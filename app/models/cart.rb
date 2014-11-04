class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :books, through: :cart_items

  def add_book_to_items(book_id)
    cart_item = cart_items.where(book_id: book_id).first

    if cart_item.nil?
      book_price = Book.find(book_id).price
      cart_item = cart_items.create(book_id: book_id, quantity: 1, price: book_price)
    else
      quantity = cart_item.quantity + 1
      cart_item.update(quantity: quantity)
      cart_item
    end
  end
end
