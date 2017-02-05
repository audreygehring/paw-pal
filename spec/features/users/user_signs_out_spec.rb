require "rails_helper"

# Acceptance Criteria:
# * As a signed in user, I click "Sign Out"
# * I am redirected to the home page
# * I see a flash notice that says "You have successfully signed out"

feature "user signs out", %{
  As a registered and authenticated user owner
  I want to sign out
  To protect my identity
} do
  scenario "authenticated user signs out" do
    user1 = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"

    click_link "Sign Out"

    expect(page).to have_content("Signed out successfully")
  end

  scenario "unauthenticated user attempts to sign out" do
    visit root_path
    expect(page).to_not have_content("Sign Out")
  end
end
