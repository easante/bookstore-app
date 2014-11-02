require 'spec_helper'

feature 'Editing Publishers' do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }
  let!(:publisher) { Fabricate(:publisher) }

  before do
    sign_in_as admin
  end

  scenario 'access to non-admin users not allowed' do
    deny_access_to_non_admins(user, 'Publishers')
  end

  scenario 'successfully editing an publisher' do
    visit root_path
    click_link 'Publishers'
    click_link publisher.name
    click_link 'Edit'

    fill_in 'Name', with: 'Paul'
    click_button 'Update Publisher'

    expect(page).to have_content('Publisher has been updated.')
  end

  scenario 'editing an publisher with invalid fields fails' do
    visit root_path
    click_link 'Publishers'
    click_link publisher.name
    click_link 'Edit'

    fill_in 'Name', with: ''
    click_button 'Update Publisher'

    expect(page).to have_content('Publisher has not been updated.')
    expect(page).to have_content("can't be blank")
  end
end
