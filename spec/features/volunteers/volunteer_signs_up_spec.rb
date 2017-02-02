require 'rails_helper'

  # Acceptance Criteria:
  # * I click "Sign Up" on the home page
  # * I am presented with a React form with two options (Volunteer & Rescue Owner)
  # * I select Volunteer and the form live updates
  # * I must submit valid name, email, etc.
  # * I will be prompted to enter correct information if I enter invalid information
  # * I will click "Submit"
  # * I will be redirected to my own Volunteer account page


  feature "volunteer registers", %{
  As an unregistered Volunteer
  I want to register
  So that I can create an account
  } do

    scenario "volunteer signs up using valid information" do
      visit new_user_registration_path

      fill_in "First Name", with: "Arya"
      fill_in "Last Name", with: "Stark"
      fill_in "Email", with: "arya@stark.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      select('Volunteer', :from => "role")

      click_button "Sign Up"

      expect(page).to have_content("Welcome! You have signed up successfully.")
      expect(page).to have_content("Sign Out")
    end

    scenario "volunteer signs up using invalid information" do
      visit new_user_registration_path

      click_button "Sign Up"

      expect(page).to have_content("can't be blank")
      expect(page).to_not have_content("Sign Out")
    end
  end
