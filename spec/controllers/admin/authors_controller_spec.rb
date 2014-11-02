require 'spec_helper'

describe Admin::AuthorsController do
  let(:admin) { Fabricate(:admin) }

  before { set_admin_user admin }

  describe "GET #new" do
    it_behaves_like "requires sign in" do
      let(:action) { get :new }
    end

    it_behaves_like "requires admin" do
      let(:action) { get :new }
    end

    it "assigns a new author object to @author variable" do
      get :new
      expect(assigns(:author)).to be_instance_of(Author)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "GET #index" do
    it_behaves_like "requires sign in" do
      let(:action) { get :index }
    end

    it_behaves_like "requires admin" do
      let(:action) { get :index }
    end

    it "assigns the authors objects to @authors variable" do
      auth1 = Fabricate(:author)
      auth2 = Fabricate(:author)

      get :index
      expect(assigns(:authors)).to match_array([auth1, auth2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET #show" do
    let(:author) { Fabricate(:author) }

    it_behaves_like "requires sign in" do
      let(:action) { get :show, id: author }
    end

    it_behaves_like "requires admin" do
      let(:action) { get :show, id: author }
    end

    it "finds the author with the given id and assigns to @author variable" do
      get :show, id: author
      expect(assigns(:author)).to eq(author)
    end

    it "renders the show template" do
      get :show, id: author
      expect(response).to render_template('show')
    end
  end

  describe "POST #create" do
    context "a successful create" do
      it_behaves_like "requires sign in" do
        let(:action) { post :create }
      end

      it_behaves_like "requires admin" do
        let(:action) { post :create }
      end

      it "saves the new author object" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(Author.count).to eq(1)
      end

      it "redirects to the show action" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(response).to redirect_to admin_author_path(Author.first)
      end

      it "sets the success flash message" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(flash[:success]).to eq('Author has been created.')
      end
    end

    context "unsuccessful create" do
      it_behaves_like "requires sign in" do
        let(:action) { post :create }
      end

      it_behaves_like "requires admin" do
        let(:action) { post :create }
      end

      it "it does not save the new author object with invalid inputs" do
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(Author.count).to eq(0)
      end

      it "renders to the new template" do
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(response).to render_template :new
      end

      it "sets the failure flash message" do
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(flash[:danger]).to eq('Author has not been created.')
      end
    end
  end

  describe "GET #edit" do
    let(:author) { Fabricate(:author, first_name: 'John') }

    it_behaves_like "requires sign in" do
      let(:action) { get :edit, id: author }
    end

    it_behaves_like "requires admin" do
      let(:action) { get :edit, id: author }
    end

    it "finds the author with the given id and assigns to @author variable" do
      get :edit, id: author
      expect(assigns(:author)).to eq(author)
    end

    it "renders the edit template" do
      get :edit, id: author
      expect(response).to render_template('edit')
    end
  end

  describe "PUT #update" do
    context "a successful update" do
      let(:author) { Fabricate(:author) }

      it_behaves_like "requires sign in" do
        let(:action) { put :update, author: Fabricate.attributes_for(:author), id: author }
      end

      it_behaves_like "requires admin" do
        let(:action) { put :update, author: Fabricate.attributes_for(:author), id: author }
      end

      it "updates the modified author object" do
        put :update, author: Fabricate.attributes_for(:author, first_name: 'Paul'), id: author.id
        expect(Author.first.first_name).to eq('Paul')
      end

      it "redirects to the show action" do
        put :update, author: Fabricate.attributes_for(:author, first_name: 'Paul'), id: author.id
        expect(response).to redirect_to admin_author_path(Author.first)
      end

      it "sets the success flash message" do
        put :update, author: Fabricate.attributes_for(:author, first_name: 'Paul'), id: author.id
        expect(flash[:success]).to eq('Author has been updated.')
      end
    end

    context "unsuccessful update" do
      let(:author) { Fabricate(:author, first_name: 'Paul') }

      it_behaves_like "requires sign in" do
        let(:action) { put :update, author: Fabricate.attributes_for(:author), id: author }
      end

      it_behaves_like "requires admin" do
        let(:action) { put :update, author: Fabricate.attributes_for(:author), id: author }
      end

      it "does not update the modified author object" do
        put :update, author: Fabricate.attributes_for(:author, first_name: ''), id: author.id
        expect(Author.first.first_name).to eq('Paul')
      end

      it "renders the edit template" do
        put :update, author: Fabricate.attributes_for(:author, first_name: ''), id: author.id
        expect(response).to render_template :edit
      end

      it "sets the failure flash message" do
        put :update, author: Fabricate.attributes_for(:author, first_name: ''), id: author.id
        expect(flash[:danger]).to eq('Author has not been updated.')
      end
    end #context
  end

  describe 'DELETE #destroy' do
    let(:author) { Fabricate(:author, first_name: 'Paul') }

    it_behaves_like "requires sign in" do
      let(:action) { delete :destroy, id: author }
    end

    it_behaves_like "requires admin" do
      let(:action) { delete :destroy, id: author }
    end

    it 'deletes the author with the given id' do
      delete :destroy, id: author
      expect(Author.count).to eq(0)
    end

    it 'sets the flash message' do
      delete :destroy, id: author
      expect(flash[:success]).to eq('Author has been deleted.')
    end

    it 'redirects to the index page' do
      delete :destroy, id: author
      expect(response).to redirect_to admin_authors_path
    end
  end

end
