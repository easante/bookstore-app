class CatalogsController < ApplicationController
  def index
    @books = Book.all.page(params[:page]).per(3)
    set_cart_if_session
  end

  def show
    begin
      @book = Book.find params[:id]
      set_cart_if_session
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "Unfortunately that book is sold out"
      redirect_to catalogs_path
    end
  end

  def search
    @books = Book.search_by_title(params[:search_word])
  end
private
  def set_cart_if_session
    set_cart if session[:cart_id]
  end
end
