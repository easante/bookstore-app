require 'spec_helper'

describe Order do
  it { should belong_to(:user) }
  it { should have_many(:order_items) }

  it "should return the total order amount" do
    book1 = Fabricate(:book, price: 10)
    book2 = Fabricate(:book, price: 20)
    order = Fabricate(:order)

    order_item1 = Fabricate(:order_item, order: order, book: book1, quantity: 2, price: 10)
    order_item2 = Fabricate(:order_item, order: order, book: book2, quantity: 1, price: 20)

    expect(order.order_total).to eq(40)
  end
end
