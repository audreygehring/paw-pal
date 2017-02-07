require 'rails_helper'

feature "user visits show page", %{
  As a registered  user
  I want to visit a shelter show page
  To learn more about the shelter
} do

  scenario 'user signs up for volunteer session' do
    user1 = FactoryGirl.create(:user)
    shelter1 = FactoryGirl.create(:shelter)
    volunteer_session1 = FactoryGirl.create(:volunteer_session, user: user1, shelter: shelter1)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content("Upcoming Volunteer Sessions")


    expect(page).to have_content(volunteer_session1.date)
  end
end
