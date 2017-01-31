require "rails_helper"

  # Acceptance Criteria:
  # * On my account page, I see a "Delete" button
  # * If I click the button, I receive an "Are you sure?" prompted
  # * If I confirm the delete, I receive a message that my account has been deleted
  # * I can no longer Sign In

feature "volunteer deletes account", %{
  As a registered  volunteer
  I want to delete my account
  If I am unsatisfied
} do

  scenario "delete account" do
    visit new_user_registration_path

    fill_in "Email", with: "test@test.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    fill_in "Role", with: "Volunteer"

    click_button "Sign Up"

    click_link "test@test.com"

    click_link "Edit my account!"

    click_button "Cancel my account"

    expect(page).to have_content("Your account has been successfully cancelled")
  end

end
