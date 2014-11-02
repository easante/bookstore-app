require 'spec_helper'

feature 'Deleting Books' do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  before do
    sign_in_as admin
  end

  scenario 'access to non-admin users not allowed' do
    deny_access_to_non_admins(user, 'Books')
  end

  scenario 'deleting a book' do
    book = Fabricate(:book)
    visit root_path
    click_link 'Books'
    click_link book.title
    click_link 'Delete'

    expect(page).to have_content('Book has been deleted.')
    expect(page.current_path).to eq(admin_books_path)
  end

end
