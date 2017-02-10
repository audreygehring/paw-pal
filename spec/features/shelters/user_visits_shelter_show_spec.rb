require 'rails_helper'

feature "user visits show page", %{
  As a registered  user
  I want to visit a shelter show page
  To learn more about the shelter
} do

  scenario 'user visits shelter show page' do
    user1 = FactoryGirl.create(:user, role: "Volunteer")
    shelter1 = FactoryGirl.create(:shelter)
    shelter2 = FactoryGirl.create(:shelter)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit shelter_path(shelter1)

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content("Upcoming Volunteer Sessions")
    expect(page).to have_content "Volunteer Here!"

    expect(page).to_not have_content(shelter2.name)
  end
end
