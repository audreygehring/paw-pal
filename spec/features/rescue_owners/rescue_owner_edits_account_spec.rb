require "rails_helper"

# Acceptance Criteria:
# * I see a link to my account in the upper right-hand corner of the page
# * If I click on it, I am redirected to my account page
# * I see an "Edit" button
# * If I click, my account information shows up in a form for editing
# * I see a button to "Save" my changes

feature "rescue owner edits account", %{
  As a registered rescue owner
  I want to edit my account
  So I can keep my account up to date
} do

  scenario "edit account" do
    user1 = FactoryGirl.create(:user, role: "Rescue Owner")
    shelter1 = FactoryGirl.create(:shelter)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    click_button "Claim this Shelter!"

    visit user_path(user1)

    expect(page).to have_content "owned shelter: #{shelter1.name}"

    click_link "Edit Account"

    fill_in "Email", with: "2#{user1.email}"
    fill_in "user_current_password", with: user1.password

    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end
end
