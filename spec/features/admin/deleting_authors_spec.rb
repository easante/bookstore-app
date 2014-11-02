require 'spec_helper'

feature 'Deleting Authors' do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  before do
    sign_in_as admin
  end

  scenario 'access to non-admin users not allowed' do
    deny_access_to_non_admins(user, 'Authors')
  end

  scenario 'deleting an author' do
    author = Fabricate(:author)
    visit root_path
    click_link 'Authors'
    click_link author.full_name
    print page.html
    click_link 'Delete'

    expect(page).to have_content('Author has been deleted.')
    expect(page.current_path).to eq(admin_authors_path)
  end

end
