require 'spec_helper'

feature 'Deleting Publishers' do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }
  let!(:publisher) { Fabricate(:publisher) }

  before do
    sign_in_as admin
  end

  scenario 'deleting an publisher' do
    deny_access_to_non_admins(user, 'Publishers')
  end

  scenario 'deleting an publisher' do
    visit root_path
    click_link 'Publishers'
    print page.html
    click_link publisher.name
    click_link 'Delete'

    expect(page).to have_content('Publisher has been deleted.')
    expect(page.current_path).to eq(admin_publishers_path)
  end

end
