require 'spec_helper'

feature "Resetting Users' Password" do
  let(:john) { Fabricate(:user, email: 'john@example.com') }

  before do
    visit root_path

    click_link 'Sign in'
    click_link 'Forgotten Password?'
  end

  scenario 'with valid email address' do
    fill_in "Email Address", with: john.email
    click_button 'Reset Password'

    expect(page).to have_content('An email with instruction')
  end

  scenario 'with invalid email address' do
    fill_in "Email Address", with: 'test@example.com'
    click_button 'Reset Password'

    expect(page).to have_content('Email invalid')
  end

  scenario 'with invalid email address' do
    fill_in "Email Address", with: ""
    click_button 'Reset Password'

    expect(page).to have_content("Email can't be blank.")
  end
end
