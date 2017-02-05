require 'rails_helper'

feature "user visits show page", %{
  As a registered  user
  I want to visit a shelter show page
  To learn more about the shelter
} do

  xscenario 'user signs up for volunteer session' do
    user1 = FactoryGirl.create(:user)
    shelter1 = FactoryGirl.create(:shelter)

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"

    visit `/shelters/#{shelter1.key}#{shelter1.zip}`

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content("Volunteer Here!")

    select('10 a.m. - 11 a.m.', :from => "time")

    expect(page).to have_content("New Volunteer Session Created!")
  end
end
