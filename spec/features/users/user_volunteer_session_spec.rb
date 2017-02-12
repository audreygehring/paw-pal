require 'rails_helper'

feature "user creates volunteer sessions", %{
  As a volunteer
  I want to sign up for sessions
  And see them to keep track of my schedule
} do
  let(:user1) { FactoryGirl.create(:user, role: "Volunteer") }
  let(:user2) { FactoryGirl.create(:user, role: "Volunteer") }
  let(:shelter1) { FactoryGirl.create(:shelter) }
  let(:session1) { FactoryGirl.create(:volunteer_session, user: user1, shelter: shelter1) }
  let(:session2) { FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter1 )}


  scenario "User signs up for a volunteer session" do

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content("Upcoming Volunteer Sessions")

    click_link "Volunteer Here!"

    fill_in "volunteer_session_date", with: "05/01/2017"
    select("10 a.m. - 11 a.m.", from: "volunteer_session_time")
    click_button "Submit"

    expect(page).to have_content "Volunteer Session added successfully"
  end

  scenario "User signs up for volunteer session time she already has" do
    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    click_link "Volunteer Here"
  end

  scenario "user does not see other users' volunteer sessions" do

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
