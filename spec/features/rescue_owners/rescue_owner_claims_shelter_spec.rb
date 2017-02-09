require "rails_helper"

  # Acceptance Criteria:
  # * A rescue owner can see a "claim this shelter" button if he/she has not already claimed a shelter
  # * If owner claims a shelter, no longer sees button
  # * Claimed shelter shows owner on show page
  # * Owner sees claimed shelter on user account page
  # * Owner sees volunteer sessions planned at his/her shelter

feature "rescue owner claims a shelter", %{
  As a registered user, role: rescue owner,
  I want to claim my shelter from the database
  So that I can keep track of scheduled volunteer sessions
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

  scenario "claims shelter" do
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

  scenario "claimed shelter shows up on user account page" do
    shelter1 = FactoryGirl.create(:shelter)
    user1 = FactoryGirl.create(:user, role: "Rescue Owner", shelter_id: shelter1.id)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit user_path(user1)

    expect(page).to have_content "owned shelter:"
    expect(page).to have_content "Upcoming Volunteer Sessions at #{shelter1.name}"
  end

  scenario "volunteer shelters at shelter show up on home page" do
    shelter1 = FactoryGirl.create(:shelter)
    user1 = FactoryGirl.create(:user, role: "Rescue Owner", shelter_id: shelter1.id)
    user2 = FactoryGirl.create(:user, role: "Volunteer")
    session1 = FactoryGirl.create(:volunteer_session, user: user2, shelter: shelter1)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    expect(page).to have_content "Upcoming Volunteer Sessions at #{shelter1.name}"
    expect(page).to have_content user2.first_name
    expect(page).to have_content user2.last_name
    expect(page).to have_content "When:"
    expect(page).to have_content session1.time
  end
end
