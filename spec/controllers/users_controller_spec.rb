require 'spec_helper'

describe UsersController do

  describe "GET new" do
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET show" do
    it "displays a user profile" do
      john = Fabricate(:user)
      get :show, id: john.id
      expect(assigns(:user)).to eq(john)
    end

    it "displays a user profile" do
      john = Fabricate(:user)
      get :show, id: john.id
      expect(response).to render_template :show
    end
  end

  describe "POST create" do
    context "successful user sign up" do
      it "redirects to the user show path" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to user_path(User.first)
      end
    end

    context "unsuccessful user sign up" do
      it "renders the new template when invalid user data is entered" do
        post :create, user: Fabricate.attributes_for(:user, first_name: "")
        expect(response).to render_template :new
      end

      it "sets the flash error message" do
        post :create, user: Fabricate.attributes_for(:user, first_name: "")
        expect(flash[:danger]).to be_present
      end
    end
  end
end
