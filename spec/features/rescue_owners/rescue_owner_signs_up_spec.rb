require 'rails_helper'

# Acceptance Criteria:
# * I click "Sign Up" on the home page
# * I am presented with a React form with two options (Volunteer & Rescue Owner)
# * I select Rescue Owner and the form live-updates
# * I must submit valid name, email, etc.
# * I will be prompted to enter correct information if I enter invalid information
# * I will click "Submit"
# * I will be redirected to my own Rescue Owner account page

feature "rescue owner registers", %{
As an unregistered Rescue Owner
I want to register
So that I can create an account
} do

  scenario "rescue owner signs up using valid information" do
    visit new_user_registration_path

    fill_in "Email", with: "test@test.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"

    expect(page).to have_content("Rescue Sign Up")
    click_button "Sign Up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "rescue owner signs up using invalid information" do
    visit new_user_registration_path

    expect(page).to have_content("Rescue Sign Up")
    click_button "Sign Up"

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end
end
