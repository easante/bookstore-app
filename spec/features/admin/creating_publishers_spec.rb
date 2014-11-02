require 'spec_helper'

feature 'Creating Publishers' do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  before do
    sign_in_as admin
  end

  scenario 'access to non-admin users not allowed' do
    deny_access_to_non_admins(user, 'Publishers')
  end

  scenario 'create a valid publisher' do
    visit root_path
    click_link 'Publishers'
    click_link 'Add New publisher'

    fill_in 'Name', with: 'John Bull'
    click_button 'Create Publisher'

    expect(page).to have_content('Publisher has been created.')
  end

  scenario 'creating publisher with invalid fields fails' do
    visit root_path
    click_link 'Publishers'
    click_link 'Add New publisher'

    fill_in 'Name', with: ''
    click_button 'Create Publisher'

    expect(page).to have_content('Publisher has not been created.')
    expect(page).to have_content("can't be blank")
  end
end
