require "rails_helper"

  # Acceptance Criteria:
  # * A rescue owner can delete volunteer sessions at his/her shelter

feature "rescue owner deletes a volunteer session", %{
  As a registered user, role: rescue owner,
  I want to delete a volunteer session
  To maintain control of my schedule
} do

  scenario "navigates to shelter show page" do
    user1 = FactoryGirl.create(:user, role: "Rescue Owner")
    shelter1 = FactoryGirl.create(:shelter)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    expect(page).to have_content shelter1.name
    expect(page).to have_button "Claim this Shelter"
    expect(page).to_not have_content "Volunteer Here!"
  end

  scenario "views shelter show page" do
    user1 = FactoryGirl.create(:user, role: "Rescue Owner")
    shelter1 = FactoryGirl.create(:shelter)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    click_button "Claim this Shelter"

    expect(page).to_not have_button "Claim this Shelter!"
    expect(page).to have_content user1.first_name
    expect(page).to have_content user1.last_name
    expect(page).to have_content "Owned By:"
  end

  scenario "deletes session" do
    shelter1 = FactoryGirl.create(:shelter)
    user1 = FactoryGirl.create(:user, role: "Rescue Owner", shelter_id: shelter1.id)
    user2 = FactoryGirl.create(:user, role: "Volunteer")
    user3 = FactoryGirl.create(:user, role: "Volunteer")
    session1 = FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter1)
    session2 = FactoryGirl.create(:volunteer_session, user: user3, shelter: shelter1)

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
