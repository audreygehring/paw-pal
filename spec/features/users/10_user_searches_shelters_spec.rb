require 'spec_helper'

# * User searches home zip code on home page
# * User sees a list of shelters in his/her area
# * User clicks the name of the shelter to reveal more information
# * User clicks a 'more' button to visit the shelter show

xfeature 'User searches for local shelters', %{
  As a user
  I want to search by zip code
  To find shelters in my area
} do
  let(:user1) { FactoryGirl.create(:user, role: "Volunteer") }

  scenario 'user searches by zip code', js: true do
    visit root_path

    save_and_open_page
    fill_in 'react-search', with: "53711"
    sleep 10


    expect(page).to have_content "Companion Animal Hospital"
    expect(page).to have_content "Dane County Friends of Ferals"
  end
end
