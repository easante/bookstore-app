require 'spec_helper'

describe PasswordResetsController do
  let(:john) { Fabricate(:user) }

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "no email address filled in" do
      it "redirects to the reset password page" do
        post :create, email: ""
        expect(response).to redirect_to reset_password_path
      end

      it "displays the danger error message" do
        post :create, email: nil
        expect(flash[:danger]).to eq("Email can't be blank.")
      end
    end

    context "invalid email address filled in" do
      it "redirects to the reset password page" do
        post :create, email: "test@example.com"
        expect(response).to redirect_to reset_password_path
      end

      it "displays error message" do
        post :create, email: "test@example.com"
        expect(flash[:danger]).to eq("Email invalid.")
      end
    end

    context "valid email address filled in"
      it "redirects to the reset password page" do
        post :create, email: john.email
        expect(response).to render_template :confirm_password_reset
      end

      it "should send an email to user email address" do
        post :create, email: john.email
        expect(ActionMailer::Base.deliveries.last.to).to eq([john.email])
      end
  end

  describe "GET #edit" do
    it "renders the edit template for a valid token" do
      mary = Fabricate(:user)
      mary.update(token: '12345')
      get :edit, id: '12345'
      expect(response).to render_template :edit
    end

    it "it redirects to the reset password page for invalid token" do
      get :edit, id: '12345'
      expect(response).to redirect_to expired_token_path
    end
  end

  describe "PUT #update" do
    context "valid token" do
      it "updates the user's password" do
        mary = Fabricate(:user, password: 'password')
        mary.update(token: '12345')
        put :update, id: '12345', user: { password: 'password2' }
        expect(mary.reload.authenticate('password2')).to be_true
      end

      it "redirects to the sign in page" do
        mary = Fabricate(:user, password: 'password')
        mary.update(token: '12345')
        put :update, id: '12345', user: { password: 'password2' }
        expect(response).to redirect_to signin_path
      end

      it "sets the flash message" do
        mary = Fabricate(:user, password: 'password')
        mary.update(token: '12345')
        put :update, id: '12345', user: { password: 'password2' }
        expect(flash[:success]).to eq("Password has been changed.")
      end

      it "regenerates the user token" do
        mary = Fabricate(:user, password: 'password')
        mary.update(token: '12345')
        put :update, id: '12345', user: { password: 'password2' }
        expect(mary.reload.token).not_to eq("12345")
      end
    end

    context "invalid token" do
      it "redirects to the expired token page" do
        put :update, id: '12345', password: 'password'
        expect(response).to redirect_to expired_token_path
      end
    end
  end
end
