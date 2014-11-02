require 'spec_helper'

feature 'Editing Books' do
  let(:admin) { Fabricate(:admin) }
  let!(:book) { Fabricate(:book) }
  let!(:wiley) { Fabricate(:publisher, name: 'Wiley') }

  before do
    sign_in_as admin
  end
  scenario 'successfully editing a book' do
    visit root_path
    click_link 'Books'
    click_link book.title
    click_link 'Edit'

    fill_in 'Title', with: 'John Bull'
    fill_in 'Isbn', with: 'John Bull'
    fill_in 'Page count', with: 189
    fill_in 'Price', with: 54.23
    fill_in 'Description', with: 'John Bull'
    fill_in 'Published at', with: '2014-01-01'
    select 'Wiley', from: 'Publisher'
    click_button 'Update Book'

    expect(page).to have_content('Book has been updated.')
  end

  scenario 'editing a book with invalid fields fails' do
    visit root_path
    click_link 'Books'
    click_link book.title
    click_link 'Edit'

    fill_in 'Title', with: ''
    fill_in 'Isbn', with: 'John Bull'
    fill_in 'Page count', with: 189
    fill_in 'Price', with: 54.23
    #Capybara.exact = false
    fill_in 'Description', with: 'John Bull'
    fill_in 'Published at', with: '2014-01-01'
    select 'Wiley', from: 'Publisher'
    click_button 'Update Book'

    expect(page).to have_content('Book has not been updated.')
    expect(page).to have_content("can't be blank")
  end
end
