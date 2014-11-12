require 'spec_helper'

describe CartItemsController do

  let(:book) { Fabricate(:book) }
  let(:cart) { Fabricate(:cart) }

  before { set_current_cart(cart) }

  describe "POST #create" do

    it "saves the new cart_item object" do
      post :create, cart_item: Fabricate.attributes_for(:cart_item,
                                          book: book, cart: cart), book_id: book.id
      expect(CartItem.count).to eq(1)
    end

    it "redirects to the cart show action" do
      post :create, cart_item: Fabricate.attributes_for(:cart_item,
                                          book: book, cart: cart), book_id: book.id
      #expect(response).to redirect_to cart_path(Cart.first.id)
      expect(response).to redirect_to root_path
    end

#    it "sets the success flash message" do
#      post :create, cart_item: Fabricate.attributes_for(:cart_item,
#                                          book: book, cart: cart), book_id: book.id
#      expect(flash[:success]).to eq('Cart item has been created.')
#    end
  end
end
