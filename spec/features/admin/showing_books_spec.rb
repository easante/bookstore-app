require 'spec_helper'

feature 'Listing Books' do
  let!(:book) { Fabricate(:book) }
  let(:admin) { Fabricate(:admin) }

  before do
    sign_in_as admin
  end

  scenario 'successfully showing book details' do
    visit root_path

    click_link 'Books'
    click_link book.title

    expect(page).to have_content(book.title)
    expect(current_path).to eq(admin_book_path(book.id))
  end

  scenario 'failed listing of all books' do
    visit root_path
    click_link 'Sign out'

    visit admin_book_path(book.id)

    expect(page).to have_content('Please sign in first!')
    expect(current_path).to eq(signin_path)
  end


end
