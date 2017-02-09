require 'rails_helper'

# Acceptance Criteria
#  * Admin has access to an index page of volunteer sessions
#  * Admin can delete a volunteer session
#  * Non-admin users cannot view the admin pages

feature "admin can see all of the volunteer sessions", %{
  As an admin,
  I want to have control over volunteer sessions,
  so that I can delete if necessary } do

  xscenario "admin views a list of users" do
    user1 = FactoryGirl.create(:user, admin: true)
    user2 = FactoryGirl.create(:user, role: "Volunteer")
    shelter1 = FactoryGirl.create(:shelter)
    shelter2 = FactoryGirl.create(:shelter)
    volunteer_session1 = FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter2)
    volunteer_session2 = FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter1)

    visit new_user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    click_link "admin"

    click_link "Volunteer Sessions List"

    expect(page).to have_content volunteer_session1.date
    expect(page).to have_content volunteer_session2.date
  end

  xscenario "admin deletes a volunteer session" do
    user1 = FactoryGirl.create(:user, admin: true)
    user2 = FactoryGirl.create(:user, role: "Volunteer")
    shelter1 = FactoryGirl.create(:shelter)
    shelter2 = FactoryGirl.create(:shelter)
    volunteer_session1 = FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter2)

    visit new_user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit admin_users_path

    click_link "Volunteer Sessions List"

    expect(page).to have_content volunteer_session1.time

    click_link "Delete Session"

    expect(page).to_not have_content volunteer_session1.time
  end

  xscenario "non-admin tries to access admin users index" do
    user1 = FactoryGirl.create(:user, admin: true)
    user2 = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Sign In"

    visit admin_users_path

    expect(page).to have_content "Sorry, you don't have access to that feature."
  end
end
