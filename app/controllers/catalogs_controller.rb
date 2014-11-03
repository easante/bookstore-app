class CatalogsController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find params[:id]
  end

  def search
    @books = Book.search_by_title(params[:search_word])
  end
end
