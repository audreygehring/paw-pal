require "rails_helper"

  # Acceptance Criteria:
  # * On my account page, I see a "Delete" button
  # * If I click the button, I receive an "Are you sure?" prompted
  # * If I confirm the delete, I receive a message that my account has been deleted
  # * I can no longer Sign In

feature "user deletes account", %{
  As a registered  user
  I want to delete my account
  If I am unsatisfied
} do

  scenario "delete account" do
    visit new_user_registration_path

    fill_in "First Name", with: "Arya"
    fill_in "Last Name", with: "Stark"
    fill_in "Email", with: "arya@stark.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    fill_in "Favorite Animal", with: "Dog"

    click_button "Sign Up"

    click_link "Edit Profile"

    click_button "Cancel my account"

    expect(page).to have_content("Your account has been successfully cancelled")
  end

end
