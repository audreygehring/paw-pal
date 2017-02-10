require 'rails_helper'

  # Acceptance Criteria:
  # * I click "Sign Up" on the home page
  # * I select rescue owner and the form live updates
  # * I must submit valid name, email, etc.
  # * I will be prompted to enter correct information if I enter invalid information
  # * I will click "Submit"
  # * I will be redirected to my own rescue owner account page


  feature "rescue owner registers", %{
  As an unregistered rescue owner
  I want to register
  So that I can create an account
  } do

    scenario "rescue owner signs up using valid information" do
      visit new_user_registration_path

      fill_in "First Name", with: "Arya"
      fill_in "Last Name", with: "Stark"
      fill_in "Email", with: "arya@stark.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      fill_in "Favorite Animal", with: "Horse"
      choose "user_role_rescue_owner"

      click_button "Sign Up"

      expect(page).to have_content("Welcome! You have signed up successfully.")
      expect(page).to have_content("sign out")
      expect(page).to_not have_content("admin")
    end

    scenario "rescue owner signs up using invalid information" do
      visit new_user_registration_path

      click_button "Sign Up"

      expect(page).to have_content("can't be blank")
      expect(page).to_not have_content("sign out")
    end
  end
