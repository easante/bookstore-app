class CatalogsController < ApplicationController
  def index
    @books = Book.all.page(params[:page]).per(3)
    set_cart_if_session
  end

  def show
    @book = Book.find params[:id]
    set_cart_if_session
    #require 'pry';binding.pry
  end

  def search
    @books = Book.search_by_title(params[:search_word])
  end
private
  def set_cart_if_session
    set_cart if session[:cart_id]
  end
end
