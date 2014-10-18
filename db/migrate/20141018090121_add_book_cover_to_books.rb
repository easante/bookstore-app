class AddBookCoverToBooks < ActiveRecord::Migration
  def change
    add_column :books, :book_cover, :string
  end
end
