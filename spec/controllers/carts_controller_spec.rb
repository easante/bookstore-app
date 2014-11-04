require 'spec_helper'

describe CartsController do
  describe "GET #show" do
    let(:cart) { Fabricate(:cart) }
    it "finds the cart with the given id and assigns to @cart variable" do
      get :show, id: cart
      expect(assigns(:cart)).to eq(cart)
    end

    it "renders the show template" do
      get :show, id: cart
      expect(response).to render_template('show')
    end
  end

  describe "DELETE #destroy" do
    let(:cart) { Fabricate(:cart) }
    it "finds the cart with the given id and assigns to @cart variable" do
      delete :destroy, id: cart
      expect(assigns(:cart)).to eq(cart)
    end

    it "sets cart session to nil" do
      delete :destroy, id: cart
      expect(session[:cart_id]).to be_nil
    end

    it "renders the show template" do
      delete :destroy, id: cart
      expect(response).to redirect_to catalogs_path
    end
  end

end
