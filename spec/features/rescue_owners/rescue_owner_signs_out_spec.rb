require "rails_helper"

# Acceptance Criteria:
# * As a signed in rescue owner, I click "Sign Out"
# * I am redirected to the home page
# * I see a flash notice that says "You have successfully signed out"

feature "rescue owner signs out", %{
  As a registered and authenticated rescue owner
  I want to sign out
  To protect my identity
} do
  scenario "authenticated user signs out" do
    rescue_owner = FactoryGirl.create(:rescue_owner)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_content("Sign Out")

    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully")
  end

  scenario "unauthenticated user attempts to sign out" do
    visit root_path
    expect(page).to_not have_content("Sign Out")
  end
end