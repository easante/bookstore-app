require 'spec_helper'

describe SessionsController do
  let!(:user) { Fabricate(:user) }

  describe "GET #new" do
    context "unauthenticated users" do
      it "renders the new template" do
        get :new
        expect(response).to render_template :new
      end
    end
    context "authenticated users" do
      it "redirects to the root path" do
        session[:user_id] = user.id

        get :new
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "POST #create" do
    context "successful sign in" do
      before do
        #require 'pry'; binding.pry
        post :create, { email: user.email, password: user.password }
      end

      it "redirects to root path" do
        expect(response).to redirect_to root_path
      end

      it "sets the flash message" do
        expect(flash[:success]).to eq ('Sign in successful.')
      end

      it "creates a session record for valid inputs" do
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context "unsuccessful sign in" do
      it "renders the sign in template" do
        post :create, { email: user.email, password: "mypassword" }

        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    it "logs the user out" do
      session[:user_id] = user.id

      delete :destroy, id: user.id
      expect(session[:user_id]).to be_nil
    end

    it "redirects to the root path" do
      delete :destroy
      expect(response).to redirect_to root_path
    end
  end
end
