require 'spec_helper'

feature 'Deleting Publishers' do
  scenario 'deleting an publisher' do
    publisher = Fabricate(:publisher)
    visit root_path
    click_link 'Publishers'
    click_link publisher.name
    click_link 'Delete'

    expect(page).to have_content('Publisher has been deleted.')
    expect(page.current_path).to eq(publishers_path)
  end

end
