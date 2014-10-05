require 'spec_helper'

describe AuthorsController do
  describe "GET #index" do
    it "assigns the authors object to @authors variable" do
      author1 = Fabricate(:author)
      author2 = Fabricate(:author)

      get :index
      expect(assigns(:authors)).to match_array([author1, author2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
