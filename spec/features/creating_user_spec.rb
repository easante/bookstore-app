require 'spec_helper'

feature 'Creating Users' do
  scenario 'Create a valid user' do
    visit root_path

    click_link 'Sign up'
    print page.html
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    fill_in 'Address', with: 'Suite 850'
    fill_in 'address_line2', with: '11 Avenue SW'
    fill_in 'City', with: 'Great City'
    fill_in 'Postal Code', with: '12345'
    click_button 'Create User'

    expect(page).to have_content('User has been created.')
  end

  scenario 'Create an invalid user' do
    visit root_path

    click_link 'Sign up'
    fill_in 'First name', with: ''
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'

    click_button 'Create User'

    expect(page).to have_content('User has not been created.')
  end

end
