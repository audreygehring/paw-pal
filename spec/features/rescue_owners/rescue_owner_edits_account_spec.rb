require "rails_helper"
  # Acceptance Criteria:
  # * I see a link to my account in the upper right-hand corner of the page
  # * If I click on it, I am redirected to my account page
  # * I see an "Edit" button
  # * If I click, my account information shows up in a form for editing
  # * I see a button to "Save" my changes

feature "rescue owner edits account", %{
  As a registered and authenticated rescue owner
  I want to edit my account
  So I can keep my account up to date
} do

  scenario "edit account" do
    visit new_user_registration_path

    fill_in "Email", with: "test@test.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"

    click_button "Sign up"

    click_link "test@test.com"

    click_button "Edit my account!"

    fill_in "Email", with: "test@test.com"
    fill_in "current_password", with: "password"

    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end
end
