require "rails_helper"

# Acceptance Criteria:
# * I see a link to my account in the upper right-hand corner of the page
# * If I click on it, I am redirected to my account page
# * I see an "Edit" button
# * If I click, my account information shows up in a form for editing
# * I see a button to "Save" my changes

feature "user edits account", %{
  As a registered user
  I want to edit my account
  So I can keep my account up to date
} do

  xscenario "edit account" do
    user1 = FactoryGirl.create(:user)

    visit edit_user_registration_path

    fill_in "Current Password", with: user1.password

    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end
end
