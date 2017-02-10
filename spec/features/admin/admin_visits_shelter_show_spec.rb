require 'rails_helper'

# Acceptance Criteria
#  * Admin can view all volunteer sessions at a particular shelter

feature "admin can see all volunteer sessions", %{
  As an admin,
  I want to have control over the users of my site,
  And see all volunteer sessions } do

  xscenario "admin visits a shelter show page" do
    user1 = FactoryGirl.create(:user, admin: true)
    user2 = FactoryGirl.create(:user, role: "Volunteer")
    user3 = FactoryGirl.create(:user, role: "Volunteer")
    shelter1 = FactoryGirl.create(:shelter)
    session1 = FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter1, time: "10 a.m. - 11 a.m.")
    session2 = FactoryGirl.create(:volunteer_session, user: user3, shelter: shelter1, time: "2 p.m. - 3 p.m.")

    visit new_user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    expect(page).to have_content user2.first_name
    expect(page).to have_content session1.time
    expect(page).to have_content user3.first_name
    expect(page).to have_content session2.time
  end
end
