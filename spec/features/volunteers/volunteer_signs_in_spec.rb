require "rails_helper"
  # Acceptance Criteria:
  # * I click "Sign In" on the home page
  # * I am presented with a form requesting email and password
  # * My password is not displayed as I enter it
  # * I must specify a valid email and password otherwise I will receive an invalid prompt
  # * If I'm already signed in, I don't have the option to Sign In


feature "volunteer signs up", %{
  As a Signed Up Volunteer
  I want to Sign In
  So that I can access my account
} do

  scenario "specify valid credentials" do
    volunteer = FactoryGirl.create(:volunteer)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_content("Sign Out")
  end

  scenario "specify invalid credentials" do
    visit new_user_session_path

    click_button "Log in"
    expect(page).to have_content("Invalid Email or password")
    expect(page).to_not have_content("Sign Out")
  end
end
