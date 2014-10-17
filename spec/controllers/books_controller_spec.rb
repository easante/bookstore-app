require 'spec_helper'

describe BooksController do
  describe "GET #new" do
    it "assigns a new book object to @book variable" do
      get :new
      expect(assigns(:book)).to be_instance_of(Book)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "GET #index" do
    it "assigns the books objects to @books variable" do
      book1 = Fabricate(:book)
      book2 = Fabricate(:book)

      get :index
      # require 'pry'; binding.pry
      expect(assigns(:books)).to match_array([book1, book2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET #show" do
    let(:book) { Fabricate(:book) }
    it "finds the book with the given id and assigns to @book variable" do
      get :show, id: book
      expect(assigns(:book)).to eq(book)
    end

    it "renders the show template" do
      get :show, id: book
      expect(response).to render_template('show')
    end
  end

  describe "POST #create" do
    context "a successful create" do
      it "saves the new book object" do
        #require 'pry';binding.pry
        post :create, book: Fabricate.attributes_for(:book)
        expect(Book.count).to eq(1)
      end

      it "redirects to the show action" do
        post :create, book: Fabricate.attributes_for(:book)
        expect(response).to redirect_to book_path(Book.first)
      end

      it "sets the success flash message" do
        post :create, book: Fabricate.attributes_for(:book)
        expect(flash[:success]).to eq('Book has been created.')
      end
    end

    context "unsuccessful create" do
      it "it does not save the new book object with invalid inputs" do
        post :create, book: Fabricate.attributes_for(:book, title: nil)
        expect(Book.count).to eq(0)
      end

      it "renders to the new template" do
        post :create, book: Fabricate.attributes_for(:book, title: nil)
        expect(response).to render_template :new
      end

      it "sets the failure flash message" do
        post :create, book: Fabricate.attributes_for(:book, title: nil)
        expect(flash[:danger]).to eq('Book has not been created.')
      end
    end
  end

  describe "GET #edit" do
    let(:book) { Fabricate(:book, title: 'John') }
    it "finds the book with the given id and assigns to @book variable" do
      get :edit, id: book
      expect(assigns(:book)).to eq(book)
    end

    it "renders the edit template" do
      get :edit, id: book
      expect(response).to render_template('edit')
    end
  end

  describe "PUT #update" do
    context "a successful update" do
      let(:book) { Fabricate(:book) }

      it "updates the modified book object" do
        put :update, book: Fabricate.attributes_for(:book, title: 'Paul'), id: book.id
        expect(Book.first.title).to eq('Paul')
      end

      it "redirects to the show action" do
        put :update, book: Fabricate.attributes_for(:book, title: 'Paul'), id: book.id
        expect(response).to redirect_to book_path(Book.first)
      end

      it "sets the success flash message" do
        put :update, book: Fabricate.attributes_for(:book, title: 'Paul'), id: book.id
        expect(flash[:success]).to eq('Book has been updated.')
      end
    end

    context "unsuccessful update" do
      let(:book) { Fabricate(:book, title: 'Paul') }

      it "does not update the modified book object" do
        put :update, book: Fabricate.attributes_for(:book, title: ''), id: book.id
        expect(Book.first.title).to eq('Paul')
      end

      it "renders the edit template" do
        put :update, book: Fabricate.attributes_for(:book, title: ''), id: book.id
        expect(response).to render_template :edit
      end

      it "sets the failure flash message" do
        put :update, book: Fabricate.attributes_for(:book, title: ''), id: book.id
        expect(flash[:danger]).to eq('Book has not been updated.')
      end
    end #context
  end

  describe 'DELETE #destroy' do
    let(:book) { Fabricate(:book, title: 'Paul') }

    it 'deletes the book with the given id' do
      delete :destroy, id: book
      expect(Book.count).to eq(0)
    end

    it 'sets the flash message' do
      delete :destroy, id: book
      expect(flash[:success]).to eq('Book has been deleted.')
    end

    it 'redirects to the index page' do
      delete :destroy, id: book
      expect(response).to redirect_to books_path
    end
  end

end
