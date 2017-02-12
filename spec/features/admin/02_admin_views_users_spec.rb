require 'rails_helper'

# Acceptance Criteria
#  * Admin has access to an index page of users
#  * Admin can delete a user
#  * Non-admin users cannot view the admin pages

feature "admin can see all of the users", %{
  As an admin,
  I want to have control over the users of my site,
  so that I can delete users if I choose to } do

  scenario "admin views a list of users" do
    user1 = FactoryGirl.create(:user, admin: true)
    user2 = FactoryGirl.create(:user, role: "Volunteer")

    visit new_user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    click_link "admin"

    expect(page).to have_content user1.first_name
    expect(page).to have_content user2.first_name
  end

  scenario "admin deletes a user" do
    user1 = FactoryGirl.create(:user, admin: true)
    user2 = FactoryGirl.create(:user, role: "Volunteer")

    visit new_user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    expect(page).to have_content "admin"

    visit admin_users_path

    click_link "Delete #{user2.email}'s Account"

    expect(page).to have_content "User deleted"
    expect(page).to_not have_content user2.first_name
  end

  scenario "non-admin tries to access admin users index" do
    user1 = FactoryGirl.create(:user, admin: true)
    user2 = FactoryGirl.create(:user, role: "Volunteer")

    visit new_user_session_path
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Sign In"

    visit admin_users_path

    expect(page).to have_content "Sorry, you don't have access to that feature."
  end
end
