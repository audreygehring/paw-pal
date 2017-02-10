require 'rails_helper'

feature "user creates volunteer sessions", %{
  As a volunteer
  I want to sign up for sessions
  And see them to keep track of my schedule
} do

  scenario "User signs up for a volunteer session" do
    user1 = FactoryGirl.create(:user, role: "Volunteer")
    shelter1 = FactoryGirl.create(:shelter)
    volunteer_session1 = FactoryGirl.create(:volunteer_session, user: user1, shelter: shelter1)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content("Upcoming Volunteer Sessions")

    click_link "Volunteer Here!"

    expect(page).to have_content
    expect(page).to have_content(volunteer_session1.date)
  end

  scenario "user does not see other users' volunteer sessions" do
    user1 = FactoryGirl.create(:user, role: "Volunteer")
    user2 = FactoryGirl.create(:user, role: "Volunteer")
    shelter1 = FactoryGirl.create(:shelter)
    volunteer_session1 = FactoryGirl.create(:volunteer_session, user: user1, shelter: shelter1)
    volunteer_session2 = FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter1)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(user1.first_name)

    expect(page).to_not have_content(user2.first_name)
  end

end