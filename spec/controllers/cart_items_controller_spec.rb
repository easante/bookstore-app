require 'spec_helper'

describe CartItemsController do

  describe "POST #create" do
    let(:book) { Fabricate(:book) }
    let(:cart) { Fabricate(:cart) }

    it "saves the new cart_item object" do
      session[:cart_id] = cart.id

      post :create, cart_item: Fabricate.attributes_for(:cart_item,
                                          book: book, cart: cart), book_id: book.id
      expect(CartItem.count).to eq(1)
    end

    it "redirects to the cart show action" do
      session[:cart_id] = cart.id

      post :create, cart_item: Fabricate.attributes_for(:cart_item,
                                          book: book, cart: cart), book_id: book.id
      expect(response).to redirect_to cart_path(Cart.first.id)
    end

    it "sets the success flash message" do
      session[:cart_id] = cart.id

      post :create, cart_item: Fabricate.attributes_for(:cart_item,
                                          book: book, cart: cart), book_id: book.id
      expect(flash[:success]).to eq('Cart item has been created.')
    end
  end
end
