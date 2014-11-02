require 'spec_helper'

feature 'Creating Users' do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  before do
    sign_in_as admin
  end

  scenario 'access to non-admin users not allowed' do
    deny_access_to_non_admins(user, 'Users')
  end

  scenario 'create a valid user' do
    visit root_path

  #  print page.html
    click_link 'Users', exact: false
    click_link 'Add New user'

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Bull'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Create User'

    expect(page).to have_content('User has been created.')
  end

  scenario 'creating user with invalid fields fails' do
    visit root_path

    click_link 'Users', exact: false
    click_link 'Add New user'

    fill_in 'First name', with: ''
    fill_in 'Last name', with: 'Bull'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
#print page.html
    click_button 'Create User'

    expect(page).to have_content('User has not been created.')
    expect(page).to have_content("can't be blank")
  end
end
