require 'rails_helper'

feature "user creates volunteer sessions", %{
  As a volunteer
  I want to sign up for sessions
  And see them to keep track of my schedule
} do

  scenario "User signs up for a volunteer session" do
    user1 = FactoryGirl.create(:user, role: "Volunteer")
    user2 = FactoryGirl.create(:user, role: "Volunteer")
    shelter1 = FactoryGirl.create(:shelter)
    session1 = FactoryGirl.create(:volunteer_session, user: user1, shelter: shelter1)
    session2 = FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter1)

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

  scenario "user sees upcoming volunteer sessions on their user page" do
    user1 = FactoryGirl.create(:user, role: "Volunteer")
    user2 = FactoryGirl.create(:user, role: "Volunteer")
    shelter1 = FactoryGirl.create(:shelter)
    session1 = FactoryGirl.create(:volunteer_session, user: user1, shelter: shelter1)
    session2 = FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter1)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit user_path(user1)

    expect(page).to have_content shelter1.name
    expect(page).to have_content session1.time
  end

  scenario "user does not see other users' volunteer sessions" do
    user1 = FactoryGirl.create(:user, role: "Volunteer")
    user2 = FactoryGirl.create(:user, role: "Volunteer")
    shelter1 = FactoryGirl.create(:shelter)
    session1 = FactoryGirl.create(:volunteer_session, user: user1, shelter: shelter1)
    session2 = FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter1)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content session1.time

    date = DateTime.parse(session2.date)
    parsed_date = date.strftime("%a., %B %d")
    expect(page).to_not have_content parsed_date

    expect(page).to_not have_content user2.first_name
  end
end
